#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/component.h>
#include <linux/slab.h>
#include <linux/of.h>
#include <linux/of_graph.h>

/*
 * 组件化驱动示例 - 展示component_add和component_del的使用
 *
 * 这个示例包含:
 * 1. 多个组件驱动（GPU、显示控制器、连接器）
 * 2. 一个主驱动（显示子系统）
 * 3. 组件匹配和绑定机制
 */

// -----------------------------------------------------------------------------
// 组件1: GPU组件
// -----------------------------------------------------------------------------
static int gpu_bind(struct device *dev, struct device *master, void *data)
{
    dev_info(dev, "GPU component bound\n");
    return 0;
}

static void gpu_unbind(struct device *dev, struct device *master, void *data)
{
    dev_info(dev, "GPU component unbound\n");
}

static const struct component_ops gpu_ops = {
    .bind = gpu_bind,
    .unbind = gpu_unbind,
};

static int gpu_probe(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "GPU component probed\n");
    return component_add(&pdev->dev, &gpu_ops);
}

static int gpu_remove(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "GPU component removed\n");
    component_del(&pdev->dev, &gpu_ops);
    return 0;
}

static const struct of_device_id gpu_of_match[] = {
    { .compatible = "example,gpu" },
    { /* Sentinel */ }
};
MODULE_DEVICE_TABLE(of, gpu_of_match);

static struct platform_driver gpu_driver = {
    .probe = gpu_probe,
    .remove = gpu_remove,
    .driver = {
        .name = "example-gpu",
        .of_match_table = gpu_of_match,
    },
};

// -----------------------------------------------------------------------------
// 组件2: 显示控制器组件
// -----------------------------------------------------------------------------
static int display_ctrl_bind(struct device *dev, struct device *master, void *data)
{
    dev_info(dev, "Display Controller component bound\n");
    return 0;
}

static void display_ctrl_unbind(struct device *dev, struct device *master, void *data)
{
    dev_info(dev, "Display Controller component unbound\n");
}

static const struct component_ops display_ctrl_ops = {
    .bind = display_ctrl_bind,
    .unbind = display_ctrl_unbind,
};

static int display_ctrl_probe(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "Display Controller component probed\n");
    return component_add(&pdev->dev, &display_ctrl_ops);
}

static int display_ctrl_remove(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "Display Controller component removed\n");
    component_del(&pdev->dev, &display_ctrl_ops);
    return 0;
}

static const struct of_device_id display_ctrl_of_match[] = {
    { .compatible = "example,display-controller" },
    { /* Sentinel */ }
};
MODULE_DEVICE_TABLE(of, display_ctrl_of_match);

static struct platform_driver display_ctrl_driver = {
    .probe = display_ctrl_probe,
    .remove = display_ctrl_remove,
    .driver = {
        .name = "example-display-ctrl",
        .of_match_table = display_ctrl_of_match,
    },
};

// -----------------------------------------------------------------------------
// 组件3: 连接器组件
// -----------------------------------------------------------------------------
static int connector_bind(struct device *dev, struct device *master, void *data)
{
    dev_info(dev, "Connector component bound\n");
    return 0;
}

static void connector_unbind(struct device *dev, struct device *master, void *data)
{
    dev_info(dev, "Connector component unbound\n");
}

static const struct component_ops connector_ops = {
    .bind = connector_bind,
    .unbind = connector_unbind,
};

static int connector_probe(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "Connector component probed\n");
    return component_add(&pdev->dev, &connector_ops);
}

static int connector_remove(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "Connector component removed\n");
    component_del(&pdev->dev, &connector_ops);
    return 0;
}

static const struct of_device_id connector_of_match[] = {
    { .compatible = "example,connector" },
    { /* Sentinel */ }
};
MODULE_DEVICE_TABLE(of, connector_of_match);

static struct platform_driver connector_driver = {
    .probe = connector_probe,
    .remove = connector_remove,
    .driver = {
        .name = "example-connector",
        .of_match_table = connector_of_match,
    },
};

// -----------------------------------------------------------------------------
// 主驱动: 显示子系统
// -----------------------------------------------------------------------------
struct display_subsystem {
    struct device *dev;
    // 可以在这里添加子系统的私有数据
};

static int display_subsystem_bind(struct device *dev)
{
    struct display_subsystem *ds = dev_get_drvdata(dev);
    int ret;

    dev_info(dev, "Display subsystem binding all components\n");

    // 绑定所有组件
    ret = component_bind_all(dev, ds);
    if (ret) {
        dev_err(dev, "Failed to bind components: %d\n", ret);
        return ret;
    }

    dev_info(dev, "Display subsystem fully initialized\n");
    return 0;
}

static void display_subsystem_unbind(struct device *dev)
{
    dev_info(dev, "Display subsystem unbinding all components\n");
    component_unbind_all(dev, dev_get_drvdata(dev));
}

static const struct component_master_ops display_subsystem_ops = {
    .bind = display_subsystem_bind,
    .unbind = display_subsystem_unbind,
};

static int compare_of(struct device *dev, void *data)
{
	struct device_node *node = dev->of_node;
	dev_info(dev, "%s line:%d node name:%s\n", __func__, __LINE__, node->name);
	dev_info(dev, "%s line:%d %px %px\n", __func__, __LINE__, dev->of_node, data);
	return (dev->of_node == data);
}

static int display_subsystem_probe(struct platform_device *pdev)
{
    struct display_subsystem *ds = NULL;
    struct component_match *match = NULL;
	struct device_node *child = NULL;
	struct device_node *remote = NULL;
    int ret;

    dev_info(&pdev->dev, "Display subsystem probing\n");

    // 分配子系统数据结构
    ds = devm_kzalloc(&pdev->dev, sizeof(*ds), GFP_KERNEL);
    if (!ds)
        return -ENOMEM;

    ds->dev = &pdev->dev;
    dev_set_drvdata(&pdev->dev, ds);

    // 添加组件匹配项
	for_each_available_child_of_node(ds->dev->of_node, child) {
		if (of_node_cmp(child->name, "dsystem") != 0)
			continue;
		remote = of_graph_get_remote_node(child, 0, 0);
		dev_info(&pdev->dev, "remote0 name:%s\n", remote->name);
		component_match_add(ds->dev, &match, compare_of, remote);
		remote = of_graph_get_remote_node(child, 1, 0);
		dev_info(&pdev->dev, "remote1 name:%s\n", remote->name);
		component_match_add(ds->dev, &match, compare_of, remote);
		remote = of_graph_get_remote_node(child, 2, 0);
		dev_info(&pdev->dev, "remote2 name:%s\n", remote->name);
		component_match_add(ds->dev, &match, compare_of, remote);
    }

    dev_info(&pdev->dev, "%s line:%d\n", __func__, __LINE__);
	
    // 注册主驱动
    ret = component_master_add_with_match(&pdev->dev, &display_subsystem_ops, match);
    if (ret) {
        dev_err(&pdev->dev, "Failed to add component master: %d\n", ret);
        return ret;
    }
    dev_info(&pdev->dev, "%s line:%d\n", __func__, __LINE__);
    dev_info(&pdev->dev, "Display subsystem probed successfully\n");
    return 0;
}

static int display_subsystem_remove(struct platform_device *pdev)
{
    dev_info(&pdev->dev, "Display subsystem removing\n");
    component_master_del(&pdev->dev, &display_subsystem_ops);
    return 0;
}

static const struct of_device_id display_subsystem_of_match[] = {
    { .compatible = "example,display-subsystem" },
    { /* Sentinel */ }
};
MODULE_DEVICE_TABLE(of, display_subsystem_of_match);

static struct platform_driver display_subsystem_driver = {
    .probe = display_subsystem_probe,
    .remove = display_subsystem_remove,
    .driver = {
        .name = "example-display-subsystem",
        .of_match_table = display_subsystem_of_match,
    },
};

// -----------------------------------------------------------------------------
// 模块初始化和清理
// -----------------------------------------------------------------------------
static int __init component_example_init(void)
{
    int ret;

    pr_info("Component example module loading\n");

    // 注册所有驱动
    ret = platform_driver_register(&gpu_driver);
    if (ret) {
        pr_err("Failed to register GPU driver: %d\n", ret);
        goto err_gpu;
    }
    pr_info("regiester gpu driver successfully.\n");

    ret = platform_driver_register(&display_ctrl_driver);
    if (ret) {
        pr_err("Failed to register display controller driver: %d\n", ret);
        goto err_display_ctrl;
    }
    pr_info("regiester display controller driver successfully.\n");

    ret = platform_driver_register(&connector_driver);
    if (ret) {
        pr_err("Failed to register connector driver: %d\n", ret);
        goto err_connector;
    }
    pr_info("regiester connector driver successfully.\n");

    ret = platform_driver_register(&display_subsystem_driver);
    if (ret) {
        pr_err("Failed to register display subsystem driver: %d\n", ret);
        goto err_subsystem;
    }
    pr_info("regiester display subsystem driver successfully.\n");

    pr_info("Component example module loaded successfully\n");
    return 0;

err_subsystem:
    platform_driver_unregister(&connector_driver);
err_connector:
    platform_driver_unregister(&display_ctrl_driver);
err_display_ctrl:
    platform_driver_unregister(&gpu_driver);
err_gpu:
    return ret;
}

static void __exit component_example_exit(void)
{
    pr_info("Component example module unloading\n");

    platform_driver_unregister(&display_subsystem_driver);
    platform_driver_unregister(&connector_driver);
    platform_driver_unregister(&display_ctrl_driver);
    platform_driver_unregister(&gpu_driver);

    pr_info("Component example module unloaded\n");
}

module_init(component_example_init);
module_exit(component_example_exit);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Linux component framework display subsystem example");
MODULE_AUTHOR("frank zhou");
MODULE_VERSION("1.0");
