#include <linux/init.h>
#include <linux/module.h>
#include <linux/kdev_t.h>
#include <linux/fs.h>
#include <linux/cdev.h>

#include <linux/dma-buf.h>
#include <linux/dma-mapping.h>

#include "hello.h"

static unsigned int majorA = 222;
static unsigned int majorB = 223;
static dev_t dev_noA;
static dev_t dev_noB;
static struct class* clsA = NULL;
static struct class* clsB = NULL;
static struct device* cls_devA = NULL;
static struct device* cls_devB = NULL;

struct dma_buf_dev {
    struct dma_buf *dma_buf;
    struct dma_buf_attachment *attach;
    struct sg_table *sg;
    void *vaddr;
    struct device *dev;
};


static struct dma_buf_dev test_devA;
static struct dma_buf_dev test_devB;

static int hello_open(struct inode* inode, struct file* file) {
    pr_info("hello_open 3\n");
    return 0;
}

static int hello_close(struct inode* inode, struct file* file) {
    pr_info("hello_close 3\n");
    return 0;
}

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

static struct file_operations hello_ops = {
    .open           = hello_open,    
    .release        = hello_close,
    .unlocked_ioctl = hello_ioctl,
#ifdef CONFIG_COMPAT
	.compat_ioctl	= hello_ioctl,
#endif
};

static int hello_init(void) {
    int result = 0;
    static u64 hello_dma_mask = DMA_BIT_MASK(32);

    pr_info("hello init enter!");

    dev_noA = MKDEV(majorA, 0);
    result = register_chrdev(majorA, "helloA", &hello_ops);
    if (result < 0) {
        pr_info("register chrdev failed! result: %d\n", result);
        return result;
    }

    clsA = class_create(THIS_MODULE, "hello_clsA");
    if (IS_ERR(clsA) != 0) {
        pr_info("class create failed!");
        result = PTR_ERR(clsA);
        goto err_1;
    }

    

    cls_devA = device_create(clsA, NULL, dev_noA, NULL, "cdriverA");
    if (IS_ERR(cls_devA) != 0) {
        pr_info("device create failed!");
        result = PTR_ERR(cls_devA);
        goto err_2;
    }

    test_devA.dev = cls_devA;
    test_devA.dev->dma_mask = &hello_dma_mask;


    dev_noB = MKDEV(majorB, 0);
    result = register_chrdev(majorB, "helloB", &hello_ops);
    if (result < 0) {
        pr_info("register chrdev failed! result: %d\n", result);
        return result;
    }

    clsB = class_create(THIS_MODULE, "hello_clsB");
    if (IS_ERR(clsB) != 0) {
        pr_info("class create failed!");
        result = PTR_ERR(clsB);
        goto err_1;
    }

    cls_devB = device_create(clsB, NULL, dev_noB, NULL, "cdriverB");
    if (IS_ERR(cls_devB) != 0) {
        pr_info("device create failed!");
        result = PTR_ERR(cls_devB);
        goto err_2;
    }

    test_devB.dev = cls_devB;
    test_devB.dev->dma_mask = &hello_dma_mask;

    return 0;

err_2:
    class_destroy(clsA);
    class_destroy(clsB);
err_1:
    unregister_chrdev(majorA, "helloA");
    unregister_chrdev(majorB, "helloB");
    return result;
}

static void hello_exit(void) {
    pr_info("hello exit enter!");
    device_destroy(clsA, dev_noA);
    class_destroy(clsA);
    device_destroy(clsB, dev_noB);
    class_destroy(clsB);
    unregister_chrdev(majorA, "helloA");
    unregister_chrdev(majorB, "helloB");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
