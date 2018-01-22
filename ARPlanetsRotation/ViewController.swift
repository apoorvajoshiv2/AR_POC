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
        self.sceneView.automaticallyUpdatesLighting = true
        showPlanets()
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPlanets() {
        let sun = SCNNode(geometry: SCNSphere(radius: 0.5))
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun diffuse")
        sun.position = parentPosition
        self.sceneView.scene.rootNode.addChildNode(sun)
        sun.name = "sun"
        
        // Added a parent node for earth to rotate earth at it's own pace rather than at sun's rotation speed
        
        let earth = placeThePlanet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Earth diffuse"), specular: #imageLiteral(resourceName: "Earth specular"), emission: #imageLiteral(resourceName: "Earth emission"), normal: #imageLiteral(resourceName: "Earth normal"), position: SCNVector3(1.8, 0, 0), planetRotationDuration: 80, planetRevolutionDuration: 25, planetName: "earth")
        
        // Rotation of the moon around the earth
        let moonParentNode = SCNNode()
        moonParentNode.position = SCNVector3(1.8, 0, 0)
        let moon = SCNNode(geometry: SCNSphere(radius: 0.04))
        moon.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Moon diffuse")
        moon.position = SCNVector3(0.4, 0, 0)
        moonParentNode.addChildNode(moon)
        earth.parent?.addChildNode(moonParentNode)
        let moonRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 15)
        moonParentNode.runAction(SCNAction.repeatForever(moonRotation))
        moon.name = "moon"
        
        // Added a parent node for venus to rotate it at it's own pace rather than at sun's rotation speed
        
        _ = placeThePlanet(geometry: SCNSphere(radius: 0.14), diffuse: #imageLiteral(resourceName: "Venus diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1.1 ,0, 0), planetRotationDuration: 50, planetRevolutionDuration: 25, planetName: "venus")
        
        // Mars
        
        _ = placeThePlanet(geometry: SCNSphere(radius: 0.25), diffuse: #imageLiteral(resourceName: "Mars diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.5 ,0, 0), planetRotationDuration: 95, planetRevolutionDuration: 25, planetName: "mars")
        
        // Jupitor
        
        _ = placeThePlanet(geometry: SCNSphere(radius: 0.5), diffuse: #imageLiteral(resourceName: "Jupitor diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.7 ,0, 0), planetRotationDuration: 120, planetRevolutionDuration: 25, planetName: "jupitor")
        
        // Mercury
        
        _ = placeThePlanet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Mercury diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.7 ,0, 0), planetRotationDuration: 40, planetRevolutionDuration: 9, planetName: "mercury")
        
        // Saturn
        
        let saturn = placeThePlanet(geometry: SCNSphere(radius: 0.45), diffuse: #imageLiteral(resourceName: "Saturn diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(5.5 ,0, 0), planetRotationDuration: 100, planetRevolutionDuration: 25, planetName: "saturn")
        let saturnRing = SCNNode(geometry: SCNTorus(ringRadius: 0.6, pipeRadius: 0.02))
        saturnRing.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Saturn Ring")
        saturnRing.position = SCNVector3(0, 0, 0)
        saturn.addChildNode(saturnRing)
        
        // Uranus
        
        _ = placeThePlanet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Uranus diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(6.5 ,0, 0.5), planetRotationDuration: 115, planetRevolutionDuration: 25, planetName: "uranus")
        
        // Neptune
        
        _ = placeThePlanet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Neptune diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(7.5 ,0, 1), planetRotationDuration: 135, planetRevolutionDuration: 25, planetName: "neptune")

    }
    
    func placeThePlanet(geometry: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3, planetRotationDuration: TimeInterval?, planetRevolutionDuration: TimeInterval?, planetName: String?) -> SCNNode {
        let parentNode = SCNNode()
        parentNode.position = parentPosition
        let node = SCNNode(geometry: geometry)
        node.geometry?.firstMaterial?.diffuse.contents = diffuse
        node.geometry?.firstMaterial?.emission.contents = emission
        node.position = position
        parentNode.addChildNode(node)
        self.sceneView.scene.rootNode.addChildNode(parentNode)
        let planetRevolution = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: planetRevolutionDuration!)
        node.runAction(SCNAction.repeatForever(planetRevolution))
        let planetRotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: planetRotationDuration!)
        parentNode.runAction(SCNAction.repeatForever(planetRotation))
        node.name = planetName
        return node
    }
    
    
    @objc func objectTapped(sender: UITapGestureRecognizer) {
        let boxTapped = sender.view as! SCNView
        let touchedCoordinates = sender.location(in: boxTapped)
        let hitTest = boxTapped.hitTest(touchedCoordinates)
        if hitTest.isEmpty {
            print("No object found")
        } else {
            let object = hitTest.first
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
