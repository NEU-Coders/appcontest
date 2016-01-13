# SceneKit参考资料

### 官方文档

这部分内容主要是官方文档中对于SceneKit的基本介绍和参考资料

* [文档入口](https://developer.apple.com/scenekit/)
* [Introduction](https://developer.apple.com/library/ios/documentation/SceneKit/Reference/SceneKit_Framework/)
*  [数据结构的资料](https://developer.apple.com/library/ios/documentation/SceneKit/Reference/SceneKit_DataTypes/)
*  [SceneKit编辑器使用教程](https://developer.apple.com/library/ios/recipes/xcode_help-scene_kit_editor/)

### 官方示范代码

这部分内容主要是官方提供的一些示范代码，可以下载下来体验一番，然后了解这种效果是怎么实现的：

* [使用SceneKit编辑器开发游戏](https://developer.apple.com/library/ios/samplecode/Fox/Introduction/Intro.html)
* [使用SceneKit开发的交通工具](https://developer.apple.com/library/ios/samplecode/SceneKitVehicle/Introduction/Intro.html)
* [SceneKit常见场景集合](https://developer.apple.com/library/ios/samplecode/SceneKitReel/Introduction/Intro.html)

### 重点推荐

[WWDC 2014 SceneKit](https://developer.apple.com/library/mac/samplecode/SceneKitWWDC2014/Introduction/Intro.html#//apple_ref/doc/uid/TP40014551-Intro-DontLinkElementID_2)：这好像是一个用`SceneKit`做的，讲解`SceneKit`的教程。里面既有知识介绍，也有Demo可供参考，有很多效果非常赞！

### 第三方优秀博客

* CocoaChina的一篇译文，非常推荐：[Scene Kit上手指南](http://www.cocoachina.com/ios/20141113/10205.html)，建议根据教程来做一遍。


# 总结概括

这部分主要是我目前的总结和概括，算是一个快速入门，有不对的地方大家一起讨论讨论。

### SceneKit中坐标系统

![SceneKit坐标系统](http://7xonij.com1.z0.glb.clouddn.com/appcontest/3d_coordinate_system.png)

坐标由`SCNVector3`类型的结构体表示，分别有`x`，`y`，`z`三个成员变量。比如，上图中的摄像机位置可以表示为：

```swift
var cameraPosition: SCNVector3 = SCNVector3Make(0, 0, 25) // z轴正半轴
```

### SceneKit结构示意图

![SceneKit基本结构](http://7xonij.com1.z0.glb.clouddn.com/appcontest/SceneKitHierarchy.png)

其中几个基本的概念如下：

* SCNView: 表示一个视图，用来展示所有的SceneKit内容。类似于iOS开发中的`UIView`。

* SCNScene: 表示一个场景，它可以理解为一个容器，所有的SceneKit中的内容都应该包含在这个场景中，一般不需要我们太关系。

* SCNNode: 表示一个节点，它是组成一个场景的基本元素。

* SCNGeometry: 表示一个几何体，它用来定义物体物理上的形状，但是它本身没有外观。也就是说它占据了一定的物理空间，但是并不负责表示这个物体长成什么样。

* SCNMaterail: 表示一个材质，它可以被重用，用来定义一个物体的外观，比如`SCNGeometry `表示一个正方体，`SCNMaterail `表示它被涂成什么颜色。

* SCNLight: 表示一个光源，它会影响物体的阴影效果。

* SCNCamera: 表示一个摄像机，通过这个摄像机的视角来看场景。

显然`SCNNode `是很重要的概念，起到承上启下的作用。

`SCNGeometry `、`SCNMaterail `、`SCNLight `、`SCNCamera `都可以被附加到某个节点上。前两点可以理解为节点的内在属性，后两者可以理解为节点的外在影响。

一般来说，一个场景只需要一个光源和摄像机，所以`SCNLight `、`SCNCamera `通常都会被添加到场景的根节点上，此后根节点的子节点只考虑`SCNGeometry `和`SCNMaterail `即可。

### SCNLight

光源有四种类型：

1. Ambient

	Ambient这个单词本身表示**“环境的”**，这里表示环境光。光源从四面八方各个方向照射物体
	
2. Omni

	Omni本身是一个前缀，表示**All**的意思。这种类型的光源表示点光源，这一点发出的光向周围发发散。它和Ambient正好是相对的，前者是光线从四周照向物体，而Omni表示光线从点光源照向四周。
	
3. Directional
	
	表示从某个方向照射来的一组平行光线。

4. Spot
	
	这个光源会照亮一个圆锥体形状的区域，类似于舞台上的聚光灯效果
	
示意图如下，这四张图中唯一的区别就是光源的类型：

![SceneKit坐标系统](http://7xonij.com1.z0.glb.clouddn.com/appcontest/lights_type.png)