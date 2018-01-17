//
//  ViewController.swift
//  ARPlanetsRotation
//
//  Created by apoorva on 15/01/18.
//  Copyright © 2018 apoorva. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        
        let sun = setPlanet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Sun diffuse"), specular: nil, emission: nil, normal: nil)
        sun.position = SCNVector3(0, 0, -2)
        self.sceneView.scene.rootNode.addChildNode(sun)
        
        // Added a parent node for earth to rotate earth at it's own pace rather than at sun's rotation speed
        let earthParentNode = SCNNode()
        earthParentNode.position = SCNVector3(0, 0, -1.5)
        let earth = setPlanet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Earth diffuse"), specular: #imageLiteral(resourceName: "Earth specular"), emission: #imageLiteral(resourceName: "Earth emission"), normal: #imageLiteral(resourceName: "Earth normal"))
        earth.position = SCNVector3(2, 0, 0)
        earthParentNode.addChildNode(earth)
        self.sceneView.scene.rootNode.addChildNode(earthParentNode)
        let earthRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 20)
        earthParentNode.runAction(SCNAction.repeatForever(earthRotation))
        
        // Rotation of the moon around the earth
        let moonParentNode = SCNNode()
        moonParentNode.position = SCNVector3(2, 0, 0)
        let moon = setPlanet(geometry: SCNSphere(radius: 0.05), diffuse: #imageLiteral(resourceName: "Moon diffuse") , specular: nil, emission: nil, normal: nil)
        moon.position = SCNVector3(0.4, 0, 0)
        moonParentNode.addChildNode(moon)
        earthParentNode.addChildNode(moonParentNode)
        let moonRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 15)
        moonParentNode.runAction(SCNAction.repeatForever(moonRotation))
        
        // Revolution of the earth around itself
        let earthRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        earth.runAction(SCNAction.repeatForever(earthRevolution))
        
        // Added a parent node for venus to rotate it at it's own pace rather than at sun's rotation speed
        let venusParentNode = SCNNode()
        venusParentNode.position = SCNVector3(0, 0, -1.5)
        let venus = setPlanet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Venus diffuse"), specular: nil, emission: #imageLiteral(resourceName: " Venus emission"), normal: nil)
        venus.position = SCNVector3(0.8 ,0, 0)
        venusParentNode.addChildNode(venus)
        self.sceneView.scene.rootNode.addChildNode(venusParentNode)
        let venusRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 15)
        venusParentNode.runAction(SCNAction.repeatForever(venusRotation))
        
    }

    func setPlanet(geometry: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normal: UIImage?) -> SCNNode {
        let node = SCNNode(geometry: geometry)
        node.geometry?.firstMaterial?.diffuse.contents = diffuse
        node.geometry?.firstMaterial?.emission.contents = emission
        return node
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension Int {
    var degreesToRadians: Float {return Float(self) * .pi/180}
}
