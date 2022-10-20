#include <linux/init.h>
#include <linux/module.h>
#include <linux/kdev_t.h>
#include <linux/fs.h>
#include <linux/miscdevice.h>
#include <linux/dma-buf.h>
#include <linux/dma-mapping.h>

#include "hello.h"

struct dma_buf_dev {
    struct dma_buf *dma_buf;
    struct dma_buf_attachment *attach;
    struct sg_table *sg;
    void *vaddr;
    struct device *dev;
};

static struct miscdevice misc_deviceA;
static struct miscdevice misc_deviceB;

static struct dma_buf_dev test_devA;
static struct dma_buf_dev test_devB;


static long hello_ioctl(struct file *file, unsigned cmd, unsigned long arg)
{
    int i;
    struct buf_info info;
    struct scatterlist *sg;

    if (copy_from_user(&info, (void __user *)arg, sizeof(info)) != 0) {
        pr_info("copy_from_user failed\n");
        return -EFAULT;
    }
    pr_info("fd[%d], buf[0x%px], size[0x%x]\n", info.fd, info.buf, info.size);

    switch(cmd) {
    case TEST_DRIVERA:
        /* for dma access */
        test_devA.dma_buf = dma_buf_get(info.fd);
        if (IS_ERR_OR_NULL(test_devA.dma_buf)) {
            pr_info("Error! failed to get dma buf");
		    return -EBUSY;
        }
        test_devA.attach = dma_buf_attach(test_devA.dma_buf, test_devA.dev);
        if (IS_ERR_OR_NULL(test_devA.attach)) {
            pr_info("Error! failed to attach dma buf");
		    return -EBUSY;
        }
        test_devA.sg = dma_buf_map_attachment(test_devA.attach, DMA_BIDIRECTIONAL);
        if (IS_ERR_OR_NULL(test_devA.sg)) {
            pr_info("Error! failed to map attached dma buf");
		    return -EBUSY;
        }

        for_each_sg(test_devA.sg->sgl, sg, test_devA.sg->nents, i) {
            pr_info("<%s: %d>addr = 0x%08llx, len = 0x%x\n",
                   __FUNCTION__, __LINE__, sg->dma_address, sg->length);
        }

        dma_buf_unmap_attachment(test_devA.attach, test_devA.sg, DMA_BIDIRECTIONAL);
        dma_buf_detach(test_devA.dma_buf, test_devA.attach);
        dma_buf_put(test_devA.dma_buf);

        /* for cpu access */
        test_devA.vaddr = dma_buf_vmap(test_devA.dma_buf);
        pr_info("<%s: %d>addr = 0x%px, str = %s\n",
               __FUNCTION__, __LINE__, test_devA.vaddr, (char *)test_devA.vaddr);
        strcpy((char *)test_devA.vaddr, "driverA kernel space!");
        dma_buf_vunmap(test_devA.dma_buf, test_devA.vaddr);

        break;

    case TEST_DRIVERB:
        /* for dma access */
        test_devB.dma_buf = dma_buf_get(info.fd);
        test_devB.attach = dma_buf_attach(test_devB.dma_buf, test_devB.dev);
        test_devB.sg = dma_buf_map_attachment(test_devB.attach, DMA_TO_DEVICE);

        for_each_sg(test_devB.sg->sgl, sg, test_devB.sg->nents, i) {
            pr_info("<%s: %d>addr = 0x%08llx, len = 0x%x\n",
                   __FUNCTION__, __LINE__, sg->dma_address, sg->length);
        }

        dma_buf_unmap_attachment(test_devB.attach, test_devB.sg, DMA_TO_DEVICE);
        dma_buf_detach(test_devB.dma_buf, test_devB.attach);
        dma_buf_put(test_devB.dma_buf);

        /* for cpu access */
        test_devB.vaddr = dma_buf_vmap(test_devB.dma_buf);
        pr_info("<%s: %d>addr = 0x%px, str = %s\n",
               __FUNCTION__, __LINE__, test_devB.vaddr, (char *)test_devB.vaddr);
        strcpy((char *)test_devB.vaddr, "driverB kernel space!");
        dma_buf_vunmap(test_devB.dma_buf, test_devB.vaddr);

        break;
    }

    return 0;
}

static const struct file_operations hello_ops = {
	.owner = THIS_MODULE,
	.unlocked_ioctl = hello_ioctl,
	.compat_ioctl = hello_ioctl,
};

static int hello_init(void) {
    int res = 0;
    static u64 hello_dma_mask = DMA_BIT_MASK(32);

    pr_info("hello init enter!");

	misc_deviceA.minor = MISC_DYNAMIC_MINOR;
	misc_deviceA.name = "cdriverA";
	misc_deviceA.fops = &hello_ops;

	res = misc_register(&misc_deviceA);
	if (res) {
		printk(KERN_WARNING"Misc device registration failed of 'cdriverA'\n");
		return res;
	}
	misc_deviceA.this_device->dma_mask = &hello_dma_mask;
    //dma_coerce_mask_and_coherent(misc_deviceB.this_device, DMA_BIT_MASK(32));

	dev_info(misc_deviceA.this_device, "cdriverA ready\n");
    //assign device pointer to struct test_dev
    test_devA.dev = misc_deviceA.this_device;


	misc_deviceB.minor = MISC_DYNAMIC_MINOR;
	misc_deviceB.name = "cdriverB";
	misc_deviceB.fops = &hello_ops;

	res = misc_register(&misc_deviceB);
	if (res) {
		printk(KERN_WARNING"Misc device registration failed of 'cdriverB'\n");
		return res;
	}
    
	misc_deviceB.this_device->dma_mask = &hello_dma_mask;
    //dma_coerce_mask_and_coherent(misc_deviceB.this_device, DMA_BIT_MASK(32));

	dev_info(misc_deviceB.this_device, "cdriverB ready\n");
    //assign device pointer to struct test_dev
    test_devB.dev = misc_deviceB.this_device;

    return res;
}

static void hello_exit(void) {
    pr_info("hello exit enter!");
    misc_deregister(&misc_deviceA);
    misc_deregister(&misc_deviceB);
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
