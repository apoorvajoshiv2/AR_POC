//
//  ViewController.swift
//  ARPlanetsRotation
//
//  Created by apoorva on 15/01/18.
//  Copyright © 2018 apoorva. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    var planetName = ""
    let parentPosition = SCNVector3(0, 0, -3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(objectTapped))
        self.sceneView.addGestureRecognizer(tapGesture)
        showPlanets()
    }

    func setPlanet(geometry: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let node = SCNNode(geometry: geometry)
        node.geometry?.firstMaterial?.diffuse.contents = diffuse
        node.geometry?.firstMaterial?.emission.contents = emission
        node.position = position
        return node
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPlanets() {
        let sun = setPlanet(geometry: SCNSphere(radius: 0.5), diffuse: #imageLiteral(resourceName: "Sun diffuse"), specular: nil, emission: nil, normal: nil, position: parentPosition)
        //        sun.position = SCNVector3(0, 0, -4)
        self.sceneView.scene.rootNode.addChildNode(sun)
        sun.name = "sun"
        
        // Added a parent node for earth to rotate earth at it's own pace rather than at sun's rotation speed
        let earthParentNode = SCNNode()
        earthParentNode.position = parentPosition
        let earth = setPlanet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Earth diffuse"), specular: #imageLiteral(resourceName: "Earth specular"), emission: #imageLiteral(resourceName: "Earth emission"), normal: #imageLiteral(resourceName: "Earth normal"), position: SCNVector3(1.8, 0, 0))
        //        earth.position = SCNVector3(2, 0, 0)
        earthParentNode.addChildNode(earth)
        self.sceneView.scene.rootNode.addChildNode(earthParentNode)
        let earthRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 20)
        earthParentNode.runAction(SCNAction.repeatForever(earthRotation))
        
        // Rotation of the moon around the earth
        let moonParentNode = SCNNode()
        moonParentNode.position = SCNVector3(1.8, 0, 0)
        let moon = setPlanet(geometry: SCNSphere(radius: 0.04), diffuse: #imageLiteral(resourceName: "Moon diffuse") , specular: nil, emission: nil, normal: nil, position: SCNVector3(0.3, 0, 0))
        //        moon.position = SCNVector3(0.4, 0, 0)
        moonParentNode.addChildNode(moon)
        earthParentNode.addChildNode(moonParentNode)
        let moonRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 15)
        moonParentNode.runAction(SCNAction.repeatForever(moonRotation))
        moon.name = "moon"
        
        // Revolution of the earth around itself
        let earthRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        earth.runAction(SCNAction.repeatForever(earthRevolution))
        earth.name = "earth"
        
        // Added a parent node for venus to rotate it at it's own pace rather than at sun's rotation speed
        let venusParentNode = SCNNode()
        venusParentNode.position = parentPosition
        let venus = setPlanet(geometry: SCNSphere(radius: 0.14), diffuse: #imageLiteral(resourceName: "Venus diffuse"), specular: nil, emission: #imageLiteral(resourceName: " Venus emission"), normal: nil, position: SCNVector3(1.1 ,0, 0))
        venusParentNode.addChildNode(venus)
        self.sceneView.scene.rootNode.addChildNode(venusParentNode)
        let venusRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        venus.runAction(SCNAction.repeatForever(venusRevolution))
        let venusRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 15)
        venusParentNode.runAction(SCNAction.repeatForever(venusRotation))
        venus.name = "venus"
        
        // Mars
        let marsParentNode = SCNNode()
        marsParentNode.position = parentPosition
        let mars = setPlanet(geometry: SCNSphere(radius: 0.25), diffuse: #imageLiteral(resourceName: "Mars diffuse"), specular: nil, emission: #imageLiteral(resourceName: " Venus emission"), normal: nil, position: SCNVector3(2.5 ,0, 0))
        marsParentNode.addChildNode(mars)
        self.sceneView.scene.rootNode.addChildNode(marsParentNode)
        let marsRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        mars.runAction(SCNAction.repeatForever(marsRevolution))
        let marsRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 30)
        marsParentNode.runAction(SCNAction.repeatForever(marsRotation))
        mars.name = "mars"
        
        // Jupitor
        let jupitorParentNode = SCNNode()
        jupitorParentNode.position = parentPosition
        let jupitor = setPlanet(geometry: SCNSphere(radius: 0.5), diffuse: #imageLiteral(resourceName: "Jupitor diffuse"), specular: nil, emission: #imageLiteral(resourceName: " Venus emission"), normal: nil, position: SCNVector3(3.7 ,0, 0))
        jupitorParentNode.addChildNode(jupitor)
        self.sceneView.scene.rootNode.addChildNode(jupitorParentNode)
        let jupitorRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        jupitor.runAction(SCNAction.repeatForever(jupitorRevolution))
        let jupitorRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 20)
        jupitorParentNode.runAction(SCNAction.repeatForever(jupitorRotation))
        jupitor.name = "jupitor"
        
        // Mercury
        let mercuryParentNode = SCNNode()
        mercuryParentNode.position = parentPosition
        let mercury = setPlanet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Mercury diffuse"), specular: nil, emission: #imageLiteral(resourceName: " Venus emission"), normal: nil, position: SCNVector3(0.7 ,0, 0))
        mercuryParentNode.addChildNode(mercury)
        self.sceneView.scene.rootNode.addChildNode(mercuryParentNode)
        let mercuryRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 9)
        mercury.runAction(SCNAction.repeatForever(mercuryRevolution))
        let mercuryRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 9)
        mercuryParentNode.runAction(SCNAction.repeatForever(mercuryRotation))
        mercury.name = "mercury"
        
        // Saturn
        let saturnParentNode = SCNNode()
        saturnParentNode.position = parentPosition
        let saturn = setPlanet(geometry: SCNSphere(radius: 0.45), diffuse: #imageLiteral(resourceName: "Saturn diffuse"), specular: nil, emission: #imageLiteral(resourceName: " Venus emission"), normal: nil, position: SCNVector3(5.5 ,0, 0))
        let saturnRing = setPlanet(geometry: SCNTorus(ringRadius: 0.6, pipeRadius: 0.02), diffuse: #imageLiteral(resourceName: "Saturn Ring"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, 0))
        saturn.addChildNode(saturnRing)
        saturnParentNode.addChildNode(saturn)
        self.sceneView.scene.rootNode.addChildNode(saturnParentNode)
        let saturnRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        saturn.runAction(SCNAction.repeatForever(saturnRevolution))
        let saturnRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 28)
        saturnParentNode.runAction(SCNAction.repeatForever(saturnRotation))
        saturn.name = "saturn"
        
        // Uranus
        let uranusParentNode = SCNNode()
        uranusParentNode.position = parentPosition
        let uranus = setPlanet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Uranus diffuse"), specular: nil, emission: #imageLiteral(resourceName: " Venus emission"), normal: nil, position: SCNVector3(6.5 ,0, 0.5))
        uranusParentNode.addChildNode(uranus)
        self.sceneView.scene.rootNode.addChildNode(uranusParentNode)
        let uranusRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        uranus.runAction(SCNAction.repeatForever(uranusRevolution))
        let uranusRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 15)
        uranusParentNode.runAction(SCNAction.repeatForever(uranusRotation))
        uranus.name = "uranus"
       
        // Neptune
        let neptuneParentNode = SCNNode()
        neptuneParentNode.position = parentPosition
        let neptune = setPlanet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Neptune diffuse"), specular: nil, emission: #imageLiteral(resourceName: " Venus emission"), normal: nil, position: SCNVector3(7.5 ,0, 1))
        neptuneParentNode.addChildNode(neptune)
        self.sceneView.scene.rootNode.addChildNode(neptuneParentNode)
        let neptuneRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        neptune.runAction(SCNAction.repeatForever(neptuneRevolution))
        let neptuneRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 24)
        neptuneParentNode.runAction(SCNAction.repeatForever(neptuneRotation))
        neptune.name = "neptune"
    }
    
    @objc func objectTapped(sender: UITapGestureRecognizer) {
        let boxTapped = sender.view as! SCNView
        let touchedCoordinates = sender.location(in: boxTapped)
        let hitTest = boxTapped.hitTest(touchedCoordinates)
        if hitTest.isEmpty {
            print("No object found")
        } else {
            let object = hitTest.first
            print("name of the object ",object?.node.name)
            planetName = (object?.node.name)!
            performSegue(withIdentifier: "segueToShow", sender: self)
        }
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        self.sceneView.layoutIfNeeded()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? DetailsViewController {
            detailsViewController.planet = planetName
        }
    }
    
}

extension Int {
    var degreesToRadians: Float {return Float(self) * .pi/180}
}
