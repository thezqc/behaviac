---
layout: docs_relatives
title: 编辑器的使用
date: 2015-12-04 13:16:38 +0800
author: cainhuang
permalink: /docs/zh/tutorials/tutorial2_usage/
categories: [tutorial]
lang: zh
---

## 1 概述
behaviac中间件是我们对行为树、有限状态机等AI范式的一种整合实现方案，主要包括编辑器（Designer）和运行时库（Runtime）两大部分。其中，编辑器用于编辑、导出元信息，也用于编辑、导出和调试行为树；运行时库也可导出元信息，主要用于解释和执行编辑器导出的行为树，运行时库需要整合到自己的游戏项目中去。

编辑器和运行时之间通过元信息（Meta）进行交互，注意元信息流动的双向箭头，表示编辑器和运行时库双方都可以导出元信息，如下图所示：

![]({{site.url}}{{site.baseurl}}/img/overview/meta.png)

图1 基于元信息的编辑器和运行时端的交互

编辑器只能运行在Windows平台上，运行时库支持C++和C#语言两个版本，对Unity引擎原生支持C#，运行时库目前支持所有主流平台，包括Windows/Linux/Android/iOS等。

该组件的使用场景，支持但不限于游戏中的逻辑、角色的人工智能、动画的控制等方面。

## 2 编辑器的使用

### 2.1 基本介绍
编辑器首次打开后为会根据操作系统的语言环境配置自动设置为中文版或英文版的界面，若需更改语言显示，可以依次选择菜单项“文件（File）”->“设置（Settings）”，在弹出的设置对话框中，选择需要的“语言（Language）”并点击“确认（OK）”后，退出并重新打开编辑器，则转为需要语言的界面。
编辑器主要分为几个部分：菜单和工具栏、行为树文件区、节点区、主视口和属性表等，如下图所示：

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/designerMainWindow.png)

图2.1 编辑器主界面

- 菜单和工具栏：主要有新建/打开工作区、新建/保存/导出/关闭行为树文件、设置、退出、帮助等菜单项或按键。
- 行为树文件区：列出了当前打开的工作区里面的所有行为树文件，双击某个行为树文件节点可以打开该文件。
- 节点区：给出了behaviac组件支持的所有行为树节点类型，在编辑行为树的时候，可以通过鼠标拖拽添加到主视口的行为树上去。
- 主视口：显示了当前打开的行为树图形，可以打开多个行为树，分页显示。
- 属性表：在主视口中点击选择某个节点后，属性表会更新显示当前选中节点的所有属性，可以编辑各个属性。

所有窗口的停靠位置均可根据个人喜好，通过鼠标在窗口边框的拖拽重新布局。编辑器中所有的按钮均可将鼠标停在上面查看其tips，以便查知其功能。编辑器中鼠标、键盘的按键用法介绍，请查看菜单中的“帮助（Help）”->“起始页（StartPage）”。

编辑器分为三种操作模式：
- 编辑模式：这是常规模式，编辑器启动后默认进入该模式，主要用于为游戏项目编辑所需的元信息和行为树。
- 连接模式：这是编辑器连接上游戏之后进入的模式，此时不能编辑行为树本身，只能用于观察行为树的高亮执行路径、设置断点等调试相关的操作。
- 分析模式：这是离线模式，在断开游戏时保存了连接过程中的所有消息，在该模式可以模拟连接模式游戏端发送过来的消息，进行离线分析行为树的执行情况。

### 2.2 操作说明

#### 2.2.1 新建工作区
首次使用编辑器，需要为自己的项目创建一个工作区：

- 点击菜单“文件”->“新建工作区”，弹出新建工作区对话框，如下图所示。

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/newWorkspace.png)

图2.2.1 新建工作区

- 依次设置工作区的名字、位置（即工作区的保存路径）、源位置（即原始行为树的保存路径）、导出位置（即运行时库所需行为树的导出路径）和元数据位置（即运行时库导出的元信息文件路径）。
- 源位置是存放编辑器创建的行为树的位置。导出位置是存放导出的行为树的位置。源位置和导出位置缺省情况下位于工作区所在的目录内：behaviors和exported。
- 元数据位置、源位置和导出位置需要和工作区文件必须位于同一个盘符下（如果位于不同的盘符下，调试的时候会有问题）。缺省情况下，它们位于同一个顶级目录下。

#### 2.2.2 打开工作区
点击菜单“文件”->“打开工作区”，选择保存在磁盘上的*.workspace.xml文件。
在安装路径下有提供的例子供参考，例如默认安装路径下的“C:\Program Files (x86)\behaviac\integration\BattleCityDemo\Assets\BTWorkspace\BattleCity.workspace.xml”，或者从菜单中的“文件”->“最近打开的工作区”列表中选择最近打开过的工作区。
behaviac组件提供了C++和C#两种编程语言的单元测试以及游戏Demo，可以通过编辑器中的菜单项“帮助”->“控制说明” 进入，然后点击快速打开所需的单元测试或游戏Demo所用到的工作区，如下图所示：

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/demoUnittest.png)

图2.2.2 快速打开单元测试和游戏Demo的工作区

#### 2.2.3 编辑工作区
点击菜单“文件”->“编辑工作区”，可以修改该工作区的设置（名字、元数据位置、源位置、导出位置等），如下图所示：

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/editWorkspace.png)

图2.2.3 编辑工作区

#### 2.2.4 新建并编辑行为树文件
- 在打开的工作区中，从工具栏里面点击“新建行为树”按钮或者通过菜单中“文件”->“新建行为树”项，创建一个行为树文件。
- 在主视口中，为新建的行为树根节点选择设置其“Agent类型”。
- 在“节点区”中用鼠标左键选择并拖拽一些节点到主视口中来构建需要的行为树，并设置每个节点的属性。每种节点的具体用法请参考菜单项“帮助”->“节点介绍”。
- 编辑过程中，支持Undo/Redo、保存等文件操作，鼠标、键盘的按键用法请对照菜单项“帮助”->“控制说明”。

#### 2.2.5 打开行为树文件
如图2.1所示，在“行为树文件区”中，双击某个行为树文件节点就可以在主视口中打开该文件。

#### 2.2.6 导出行为树文件
- 编辑完行为树之后，可以通过菜单项“文件”->“导出行为树”（或者快捷键Ctrl+T）导出当前打开的行为树文件。
- 通过菜单项“文件”->“导出全部”项（或者快捷键Ctrl+Shift+T）导出工作区中的所有行为树文件。
- 目前支持4种文件格式的导出，即XML、BSON、C++和C#，如下图所示：

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/exportBehaviors.png)

图2.2.6.1 导出行为树

- 对于C++/C#格式的导出，还可以设置导出的文件名和位置。点击图2.2.6.1中“导出设置”->“设置”列的“…”按钮，可以弹出“C++/C#导出设置”对话框。对于C++文件，还需添加游戏项目中Agent子类的.h头文件，如图2.2.6.2所示。
导出后，将在指定的导出路径下生成behaviac_generated目录，里面又包含了behaviors和types两个子目录，需要将这两个子目录里面的所有文件全部包含到自己的项目中去。
注意：对于导出C++文件，如果不添加Agent子类的.h头文件，那么需要注意将behaviors和types两个子目录中生成的头文件放在项目代码include “yourAgent.h”之后，以确保Agent子类先被包含进来，否则会有编译错误。

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/exportSettings.png)

图2.2.6.2 C++/C#的导出设置

- 图2.2.6.2中的选项“是否导出统一文件”用来表示导出的C++或者C#文件是否为一个统一的大文件还是若干个小文件，其中每个小文件对应一个行为树。
- 运行时库支持行为树导出文件的热加载，如果在编辑器修改完行为树之后，重新导出，游戏端会自动重新加载所用到的行为树，无需重启游戏。

#### 2.2.7 连接游戏
- 从开始菜单中，启动小游戏BattleCityDemo，如下图所示：

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/battleCityDemo.png)

图2.2.7.1 Battle City Demo

- 点击游戏主界面右上角的“Show Levels”按钮，可以切换不同的关卡，如下图所示：

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/selectGameLevel.png)

图2.2.7.2 选择关卡

- 点击游戏主界面左下角的“Launch Designer”按钮，启动编辑器，编辑器会自动打开BattleCityDemo的工作区，并打开游戏当前关卡所用到的行为树（如果没有切换其他关卡，默认打开的是Tank_Fire_Random行为树文件）。
- 点击编辑器工具栏中的“连接游戏”按钮或通过菜单项“文件”->“连接游戏”（或通过快捷键Ctrl+L），开始连接游戏。默认的，一般无需更改服务器IP和端口号，如图2.2.7.3所示。
注意：有时候可能会发现连不上游戏，很可能是原来的端口号已被占用，可以尝试在运行时端的端口号60636改为其他值，然后相应的修改图2.2.7.3中的端口号，尝试重新连接游戏。

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/connectGame.png)

图2.2.7.3 连接游戏

- 连接成功后，编辑器从编辑模式切换到连接模式，如下图所示：

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/connectMode.png)

图2.2.7.4 连接模式

- 时间轴（Timeline）：默认位于编辑器最上方，用于表示当前帧相关的信息。
- 实例列表：列出了游戏中所有的对象实例，双击实例节点后可以开始跟踪调试选中的实例，右键单击实例节点弹出如下菜单，如图2.2.7.5所示。其中“调试”跟双击节点的作用一致，开始跟踪选中的实例，主视口会高亮显示行为树的执行路径；“查看属性”用于跟踪当前选中实例的所有属性的变化，编辑器会弹出实例的属性列表。

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/debugInstance.png)

图2.2.7.5 实例右键菜单

- 主视口：高亮的节点边框和连接线段，表示程序当前执行的路径情况。双击树中节点的左右两侧，可以设置节点的断点（左侧表示进入断点，右侧表示退出断点），用于游戏执行时在断点位置停下来，游戏断下来后按F5键后继续运行。
- 输出窗口：列出了收到的全部消息，用于调试时查看记录。
- Agent的属性：可以显示当前Agent属性的变化。
- 断点：通过菜单项“视图”->“断点”打开断点窗口后，可以查看、管理当前工作区中的所有断点。

#### 2.2.8 分析导出数据
- 点击菜单或工具栏中的“断开游戏”按键，断开与游戏端的连接，回到编辑模式。
- 默认弹出如下对话框，保存之前连接模式下调试的相关数据。

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/saveDump.png)

图2.2.8.1 保存dump数据

- 点击菜单或工具栏中的“分析导出文件”按键，选择打开上一步导出的数据文件，编辑器进入到分析模式。
- 分析模式的界面布局跟连接模式类似，但是可以通过时间轴里面的播放按钮开始重现连接过程中的情况，如下图所示：

![]({{site.url}}{{site.baseurl}}/img/tutorials/tutorial2/analyzeDump.png)

图2.2.8.2 分析dump数据

- 要退出分析模式，可以点击菜单或工具栏中的“终止分析”按键，回到编辑模式。

#### 2.2.9 其他
除了BattleCityDemo小游戏（基于Unity引擎实现，运行时库为C#版）之外，还有LaunchCocosGame（基于Cocos引擎实现，运行时库为C++版）和LaunchSDLDemo小游戏（基于SDL库实现，运行时库为C++版）。
如图2.2所示，从操作系统的开始菜单中启动LaunchCocosGame或LaunchSDLDemo小游戏后，游戏跟编辑器的连接需要单独启动编辑器，然后再点击编辑器工具栏中的“连接游戏”按钮或通过菜单项“文件”->“连接游戏”（快捷键Ctrl+L），开始连接游戏。连接后，执行情况跟BattleCityDemo小游戏类似。

