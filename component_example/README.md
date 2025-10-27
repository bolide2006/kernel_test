# Linux Component Framework Example

[toc]

这是一个展示Linux内核组件化驱动框架使用方法的示例，特别是component_add和component_del函数的使用。

## 概述

这个示例展示了如何使用Linux内核的组件化驱动框架，将一个复杂的设备驱动分解为多个独立的组件。示例包含：

- **GPU组件**：模拟图形图形处理单元
- **显示控制器组件**：处理显示控制功能
- **连接器组件**：管理显示连接器
- **显示子系统主驱动**：协调所有组件的工作

## 功能特点

1. **组件化设计**：将复杂驱动分解为独立组件，提高代码可维护性
2. **动态绑定**：使用component框架自动绑定和初始化所有组件
3. **热插拔支持**：组件可以动态添加和移除
4. **设备树支持**：通过设备树描述硬件配置

## 代码结构

```
component_example/
├── component_example.c  # 主要源代码
├── Makefile             # 编译脚本
└── README.md            # 说明文档
```

## 编译和安装

### 编译模块

```bash
make
```

### 安装模块

```bash
sudo make install
```

### 加载模块

```bash
sudo insmod test-component.ko
```

### 卸载模块

```bash
sudo rmmod test-component
```

## 设备树配置

需要在设备树中添加以下节点：

```dts
/ {
	display-subsystem {
		compatible = "example,display-subsystem";
		label = "example-display-subsystem";
		ds: dsystem@0 {
			reg = <0>;
			ports {
				#address-cells = <1>;
				#size-cells = <0>;

				port@0 {
					reg = <0>;
					dp_out0: endpoint@0 {
						remote-endpoint = <&gpu_in>;
					};
				};
				
				port@1 {
					reg = <1>;
					dp_out1: endpoint@1 {
						remote-endpoint = <&dc_in>;
					};
				};
				
				port@2 {
					reg = <2>;
					dp_out2: endpoint@2 {
						remote-endpoint = <&connector_in>;
					};
				};
			};
		};
	};
	
	gpu {
		compatible = "example,gpu";
		ports {
			#address-cells = <1>;
			#size-cells = <0>;
			port@0{
				reg = <0>;
				gpu_in: endpoint{
					remote-endpoint = <&dp_out0>;
				};
			};
		};
	};

	display-controller {
		compatible = "example,display-controller";
		ports {
			#address-cells = <1>;
			#size-cells = <0>;
			port@0{
				reg = <0>;
				dc_in: endpoint{
					remote-endpoint = <&dp_out1>;
				};
			};
		};
	};

	connector {
		compatible = "example,connector";
		ports {
			#address-cells = <1>;
			#size-cells = <0>;
			port@0{
				reg = <0>;
				connector_in: endpoint{
					remote-endpoint = <&dp_out2>;
				};
			};
		};
	};
};
```

## 运行原理

1. **模块初始化**：注册所有组件驱动和主驱动
2. **组件探测**：当硬件被探测到时，组件驱动调用`component_add`注册组件
3. **主驱动匹配**：主驱动使用`component_match_add`创建组件匹配列表
4. **组件绑定**：当所有组件都准备好后，框架自动调用`component_bind_all`绑定所有组件
5. **驱动卸载**：模块卸载时调用`component_del`和`component_master_del`清理资源

## 查看日志

```bash
dmesg -n 7
echo -n "file component.c +p" > /sys/kernel/debug/dynamic_debug/control
echo -n "file property.c +p" > /sys/kernel/debug/dynamic_debug/control
cat /sys/kernel/debug/device_component/display-subsystem
```

## 主要API说明

### component_add

```c
int component_add(struct device *dev, const struct component_ops *ops);
```

注册一个组件到组件框架。通常在驱动的probe函数中调用。

### component_del

```c
void component_del(struct device *dev, const struct component_ops *ops);
```

从组件框架中移除一个组件。通常在驱动的remove函数中调用。

### component_match_add

```c
void component_match_add(struct device *parent, struct component_match **matchptr,
                        int (*compare)(struct device *, void *), void *compare_data);
```

为主驱动添加组件匹配项。

### component_master_add_with_match

```c
int component_master_add_with_match(struct device *dev,
                                  const struct component_master_ops *ops,
                                  struct component_match *match);
```

注册一个主驱动及其组件匹配列表。

## 注意事项

1. 确保内核配置中启用了组件框架（`CONFIG_COMPONENT=y`）
2. 这个示例是一个概念验证，不对应真实硬件。
3. 在实际使用中，需要根据具体硬件平台进行适配。

## Kernel Log
```
[root@JunoR2-ISP dpu]# insmod test-component.ko 
[   86.613415] test_component: loading out-of-tree module taints kernel.
[   86.651305] Component example module loading
[   86.654324] example-gpu gpu: GPU component probed
[   86.661808] regiester gpu driver successfully.
[   86.664286] example-display-ctrl display-controller: Display Controller component probed
[   86.668073] regiester display controller driver successfully.
[   86.670707] example-connector connector: Connector component probed
[   86.673948] regiester connector driver successfully.
[   86.675722] example-display-subsystem display-subsystem: Display subsystem probing
[   86.677796] OF: fzhou of_graph_get_endpoint_by_regs parent name:dsystem
[   86.678802] OF: fzhou of_graph_get_endpoint_by_regs node name:endpoint
[   86.681433] example-display-subsystem display-subsystem: remote0 name:gpu
[   86.683366] OF: fzhou of_graph_get_endpoint_by_regs parent name:dsystem
[   86.684115] OF: fzhou of_graph_get_endpoint_by_regs node name:endpoint
[   86.685154] OF: fzhou of_graph_get_endpoint_by_regs parent name:dsystem
[   86.686172] OF: fzhou of_graph_get_endpoint_by_regs node name:endpoint
[   86.687095] example-display-subsystem display-subsystem: remote1 name:display-controller
[   86.688301] OF: fzhou of_graph_get_endpoint_by_regs parent name:dsystem
[   86.689264] OF: fzhou of_graph_get_endpoint_by_regs node name:endpoint
[   86.690330] OF: fzhou of_graph_get_endpoint_by_regs parent name:dsystem
[   86.691247] OF: fzhou of_graph_get_endpoint_by_regs node name:endpoint
[   86.692182] OF: fzhou of_graph_get_endpoint_by_regs parent name:dsystem
[   86.693074] OF: fzhou of_graph_get_endpoint_by_regs node name:endpoint
[   86.694593] example-display-subsystem display-subsystem: remote2 name:connector
[   86.695725] example-display-subsystem display-subsystem: display_subsystem_probe line:236
[   86.696984] call component_master_add_with_match dev:ffff000002d6fc10
[   86.698214] example-display-subsystem display-subsystem: call component_master_add_with_match ffff000002d6fc10 match num:3
[   86.699814] example-display-subsystem display-subsystem: call component_master_add_with_match line:490
[   86.701316] example-display-subsystem display-subsystem: call component_master_add_with_match line:494
[   86.703460] example-display-subsystem display-subsystem: call component_master_add_with_match line:503
[   86.705431] fzhou @1 c->master 0000000000000000 master:ffff00000396f480
[   86.706926] example-gpu gpu: compare_of line:198 node name:gpu
[   86.707766] example-gpu gpu: compare_of line:199 ffff00007fbf0428 ffff00007fbf0428
[   86.708784] fzhou find_component line:176
[   86.710298] fzhou @1 c->master ffff00000396f480 master:ffff00000396f480
[   86.711107] example-gpu gpu: compare_of line:198 node name:gpu
[   86.711878] example-gpu gpu: compare_of line:199 ffff00007fbf0428 ffff00007fbf0ad8
[   86.713066] fzhou @1 c->master 0000000000000000 master:ffff00000396f480
[   86.714208] example-display-ctrl display-controller: compare_of line:198 node name:display-controller
[   86.715312] example-display-ctrl display-controller: compare_of line:199 ffff00007fbf0ad8 ffff00007fbf0ad8
[   86.716327] fzhou find_component line:176
[   86.717471] fzhou @1 c->master ffff00000396f480 master:ffff00000396f480
[   86.718540] example-gpu gpu: compare_of line:198 node name:gpu
[   86.719470] example-gpu gpu: compare_of line:199 ffff00007fbf0428 ffff00007fbf11a8
[   86.720541] fzhou @1 c->master ffff00000396f480 master:ffff00000396f480
[   86.721416] example-display-ctrl display-controller: compare_of line:198 node name:display-controller
[   86.722965] example-display-ctrl display-controller: compare_of line:199 ffff00007fbf0ad8 ffff00007fbf11a8
[   86.724237] fzhou @1 c->master 0000000000000000 master:ffff00000396f480
[   86.725055] example-connector connector: compare_of line:198 node name:connector
[   86.726280] example-connector connector: compare_of line:199 ffff00007fbf11a8 ffff00007fbf11a8
[   86.727180] fzhou find_component line:176
[   86.728673] example-display-subsystem display-subsystem: Display subsystem binding all components
[   86.730854] example-gpu gpu: GPU component bound
[   86.732712] example-display-subsystem display-subsystem: bound gpu (ops gpu_ops [test_component])
[   86.734334] example-display-ctrl display-controller: Display Controller component bound
[   86.735341] example-display-subsystem display-subsystem: bound display-controller (ops display_ctrl_ops [test_component])
[   86.736733] example-connector connector: Connector component bound
[   86.738203] example-display-subsystem display-subsystem: bound connector (ops connector_ops [test_component])
[   86.739460] example-display-subsystem display-subsystem: Display subsystem fully initialized
[   86.740646] example-display-subsystem display-subsystem: call component_master_add_with_match line:508
[   86.742125] example-display-subsystem display-subsystem: display_subsystem_probe line:244
[   86.743090] example-display-subsystem display-subsystem: Display subsystem probed successfully
[   86.746460] regiester display subsystem driver successfully.
[   86.747321] Component example module loaded successfully
```

## 参考文档

- [Linux Kernel Component Framework Documentation](https://www.kernel.org/doc/html/latest/driver-api/component.html)
- [Linux Device Drivers, 3rd Edition](https://lwn.net/Kernel/LDD3/)
