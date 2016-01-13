# SceneKit参考资料

### 官方文档

这部分内容主要是官方文档中对于SceneKit的基本介绍和参考资料

* [文档入口](https://developer.apple.com/scenekit/)
* [Introduction](https://developer.apple.com/library/ios/documentation/SceneKit/Reference/SceneKit_Framework/)
*  [数据结构的资料](https://developer.apple.com/library/ios/documentation/SceneKit/Reference/SceneKit_DataTypes/)
*  [SceneKit编辑器使用教程](https://developer.apple.com/library/ios/documentation/SceneKit/Reference/SceneKit_DataTypes/)

### 官方教程

这部分内容主要是官方发布的一些实战教程

* [使用SceneKit编辑器开发游戏](https://developer.apple.com/library/ios/samplecode/Fox/Introduction/Intro.html)
* [使用SceneKit开发的交通工具](https://developer.apple.com/library/ios/samplecode/SceneKitVehicle/Introduction/Intro.html)
* [抱歉不会翻译这个名字](https://developer.apple.com/library/ios/samplecode/SceneKitReel/Introduction/Intro.html)
* [一个3D游戏](https://developer.apple.com/library/ios/samplecode/Bananas/Introduction/Intro.html)

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

