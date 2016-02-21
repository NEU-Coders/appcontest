//
//  GameViewController.swift
//  SceneKit-Demo
//
//  Created by 张星宇 on 16/1/25.
//  Copyright (c) 2016年 zxy. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    let scene = SCNScene(named: "art.scnassets/main.scn")!
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneSetup()
    }
    
    func sceneSetup() {
        //从四面八方照向scene的环境光
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor(white: 0.67, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        
        // 从远点向外发射的点光源
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLightTypeOmni
        omniLightNode.light!.color = UIColor(white: 0.75, alpha: 1.0)
        scene.rootNode.addChildNode(omniLightNode)
        
        let sceneView = self.view as! SCNView
        sceneView.allowsCameraControl = true
        sceneView.scene = scene
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
