//
//  ViewController.swift
//  ARKitObjects
//
//  Created by KISHANI on 01/06/24.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    private var labelName:UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.labelName.frame = CGRect(x: 0, y: 0, width: self.sceneView.frame.size.width, height: 44)
        self.labelName.center = self.sceneView.center
        self.labelName.textAlignment = .center
        self.labelName.textColor = .brown
        self.labelName.alpha = 0
        self.sceneView.addSubview(self.labelName)
        
        
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
       // let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        
        /*
         
         // this is for creating box
        let box = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0)// all size in meters
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green
        box.materials = [material]
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(x: 0, y: 0, z: -0.5)
        self.sceneView.scene.rootNode.addChildNode(boxNode)
        */
        
        /*
        
         //Adding Text
        let text = SCNText(string: "Hello welcome to Learning with Kishani Youtube Channel", extrusionDepth: 1.0)
        text.firstMaterial?.diffuse.contents = UIColor.blue
        let textNode = SCNNode(geometry: text)
        textNode.position = SCNVector3(0, 0, -0.5)
        textNode.scale = SCNVector3(0.001, 0.001, 0.001)
        self.sceneView.scene.rootNode.addChildNode(textNode)
        
        */
        
        
        //Add multipleVitual object
        
    
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "Kishani.JPG")
        
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0, 0, -0.5)
        boxNode.geometry?.materials = [material]
        
        let box2 = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        
        let material1 = SCNMaterial()
        material1.diffuse.contents = UIImage(named: "Tamizhini.JPG")
        
        let boxNode1 = SCNNode(geometry: box2)
        boxNode1.position = SCNVector3(0.5, 0, -0.5)
        boxNode1.geometry?.materials = [material1]
       
        self.sceneView.scene.rootNode.addChildNode(boxNode)
        self.sceneView.scene.rootNode.addChildNode(boxNode1)
         
         
        
        /*
         
        // add tap gestures
        
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let material = SCNMaterial()
        material.name = "Color"
        material.diffuse.contents = UIColor.green
        
        let node = SCNNode()
        node.geometry = box
        node.geometry?.materials = [material]
        node.position = SCNVector3(0, 0.1, -0.5)
        scene.rootNode.addChildNode(node)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        self.sceneView.scene = scene
        
        */
        
        self.sceneView.scene = scene
        
        
        
    }
    
    @objc func tapped(recognizer: UIGestureRecognizer) {
        
        let sceneView = recognizer.view as! SCNView
        let touchLocation = recognizer.location(in: sceneView)
        let hitResult = sceneView.hitTest(touchLocation, options: [:])
        
        if !hitResult.isEmpty {
            
            let node = hitResult[0].node
            let material = node.geometry?.material(named:"Color")
            
            material?.diffuse.contents = UIColor.yellow
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            self.labelName.text = "plan detected"
            UIView.animate(withDuration: 0.4, animations: {
                self.labelName.alpha = 0.0
            }){(completion :Bool) in
                self.labelName.alpha = 0.0
                
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
    */

    
    /*
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    */
}
