//
//  FaceMaskViewController.swift
//  FaceMask
//
//  Created by aymane hachcham on 5/10/21.
//

import Foundation
import ARKit
import UIKit

class FaceMaskViewController: UIViewController, ARSCNViewDelegate {
    
    let sceneView = ARSCNView(frame: UIScreen.main.bounds)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create the session configuration for ARKit
        guard ARFaceTrackingConfiguration.isSupported else {return}
        let configuration = ARFaceTrackingConfiguration()
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Stop the ARFaceTracking Session:
        sceneView.session.pause()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        view.addSubview(sceneView)
        title = "Face Mask"
        setUpTabBar()
    }
    
    fileprivate func setUpTabBar(){
        
        // The Setup Bar
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = .lightText
        self.navigationController?.setNeedsStatusBarAppearanceUpdate()
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.backgroundColor = .systemGray4
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = sceneView.device else {return nil}
        
        // Configuring Facial Gemoetry object to initialize the node:
        let facialGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: facialGeometry)
        node.geometry?.firstMaterial?.fillMode = .lines
        
        return node
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor,
              let faceGeometry = node.geometry as? ARSCNFaceGeometry else {return}
        
        faceGeometry.update(from: faceAnchor.geometry)
    }
    
}

