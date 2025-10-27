#include <linux/dma-fence.h>
#include <linux/module.h>
#include <linux/kthread.h>
#include <linux/delay.h>
#include <linux/slab.h>

/* 定义自定义 fence 结构 */
struct my_fence {
    spinlock_t lock;
    struct dma_fence base;
    struct task_struct *thread;
};

/* 转换宏：从 dma_fence 指针获取自定义 fence 结构 */
#define to_my_fence(f) container_of(f, struct my_fence, base)

/* 释放 fence 资源的回调函数 */
static void my_fence_release(struct dma_fence *fence)
{
    struct my_fence *mf = to_my_fence(fence);
    pr_info("my_fence: 释放 fence 资源\n");
    kfree(mf);
}

/* 获取驱动名称的回调函数 */
static const char* my_fence_get_driver_name(struct dma_fence *fence)
{
    static char *driver_name = "my_fence";
    return driver_name;
}

/* 获取时间线名称的回调函数 */
static const char* my_fence_get_timeline_name(struct dma_fence *fence)
{
    static char *timeline_name = "my_timeline";
    return timeline_name;
}

//!ops || !ops->get_driver_name || !ops->get_timeline_name

/* 定义 fence 操作 */
static const struct dma_fence_ops my_fence_ops = {
    .get_driver_name = my_fence_get_driver_name,
    .get_timeline_name = my_fence_get_timeline_name,
    .release = my_fence_release,
};

/* 模拟硬件操作的线程函数 */
static int hw_operation_thread(void *data)
{
    struct my_fence *mf = data;
    pr_info("my_fence: 开始模拟硬件操作...\n");

    /* 模拟硬件操作耗时 */
    msleep(2000);

    pr_info("my_fence: 硬件操作完成，发送信号\n");
    /* 标记 fence 为已完成 */
    dma_fence_signal(&mf->base);

    return 0;
}

/* 创建并启动一个带 fence 的硬件操作 */
static struct dma_fence *start_hw_operation(void)
{
    struct my_fence *mf;
    int ret;

    /* 分配并初始化 fence */
    mf = kzalloc(sizeof(*mf), GFP_KERNEL);
    if (!mf)
        return ERR_PTR(-ENOMEM);

    spin_lock_init(&mf->lock);
    /* 初始化 dma_fence 基础结构 */
    dma_fence_init(&mf->base, &my_fence_ops, &mf->lock,
                  dma_fence_context_alloc(1), 0);

    /* 创建线程模拟硬件操作 */
    mf->thread = kthread_run(hw_operation_thread, mf, "hw_operation");
    if (IS_ERR(mf->thread)) {
        ret = PTR_ERR(mf->thread);
        dma_fence_put(&mf->base);
        return ERR_PTR(ret);
    }

    return &mf->base;
}

/* 等待 fence 完成的示例函数 */
static void wait_for_fence_completion(struct dma_fence *fence)
{
    int ret;

    pr_info("my_fence: 等待 fence 完成...\n");

    /* 等待 fence 完成，超时时间为 5 秒 */
    ret = dma_fence_wait_timeout(fence, false, 5 * HZ);

    if (ret == 0) {
        pr_err("my_fence: 等待超时\n");
    } else if (ret > 0) {
        pr_info("my_fence: fence 已完成\n");
    } else {
        pr_err("my_fence: 等待出错: %d\n", ret);
    }

    /* 减少 fence 引用计数 */
    dma_fence_put(fence);
}

static int __init dma_fence_example_init(void)
{
    struct dma_fence *fence;

    pr_info("dma_fence 示例初始化\n");

    /* 启动硬件操作并获取 fence */
    fence = start_hw_operation();
    if (IS_ERR(fence)) {
        pr_err("无法创建 fence: %ld\n", PTR_ERR(fence));
        return PTR_ERR(fence);
    }

    /* 等待 fence 完成 */
    wait_for_fence_completion(fence);

    return 0;
}

static void __exit dma_fence_example_exit(void)
{
    pr_info("dma_fence 示例退出\n");
}

module_init(dma_fence_example_init);
module_exit(dma_fence_example_exit);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("DMA Fence 使用示例");