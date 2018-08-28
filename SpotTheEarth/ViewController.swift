import UIKit
import ARKit

class ViewController: UIViewController {

    // MARK: - SceneKit
    private lazy var sceneView: SCNView? = {
        guard let scnView = view as? SCNView else {
            return nil
        }
        
        scnView.scene = SCNScene()
        scnView.showsStatistics = true
        scnView.allowsCameraControl = true
        
        return scnView
    }()
    
    private let timerVC = TimerViewController()
    
    // MARK: - ARKit
    private lazy var arSceneView: ARSCNView? = {
        let arScnView = view as? ARSCNView
        arScnView?.scene = SCNScene()
        return arScnView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupARScene()
    }
}

// MARK: - SceneKit sandbox

extension ViewController {
    
    private func setupScene() {
        setupSceneView()
        addCamera()
        addEarthModel()
        addLight()
    }
    
    private func setupSceneView() {
        // TODO
        sceneView?.backgroundColor = .black
    }
    
    private func addCamera() {
        // TODO
        let cameraNode = SCNNode()
        cameraNode.position = SCNVector3(0.0, 0.0, 2.0)
        cameraNode.camera = SCNCamera()
        sceneView?.scene?.rootNode.addChildNode(cameraNode)
    }
    
    private func addEarthModel() {
        // TODO
        sceneView?.scene?.rootNode.addChildNode(EarthNode())
    }
    
    private func addLight() {
        // TODO
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.light?.color = UIColor.red
        lightNode.position = SCNVector3(0.0, 0.0, 5.0)
        sceneView?.scene?.rootNode.addChildNode(lightNode)
    }
}

// MARK: - ARKit sandbox

extension ViewController {

    private func setupARScene() {
        // TODO
        runARSession()
        spawnEarthInRandomPosition()
        addTimer()
    }
    
    private func runARSession() {
        // TODO
        arSceneView?.session.run(ARWorldTrackingConfiguration())
    }
    
    private func spawnEarthInRandomPosition() {
        // TODO
        let model = EarthNode()
        model.position = SCNVector3.random
        sceneView?.scene?.rootNode.addChildNode(model)
    }
    
    private func addTimer() {
        // TODO
        add(timerVC)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // TODO
        if let touch = touches.first, let arSceneView = arSceneView {
            let location = touch.location(in: arSceneView)
            let hitTest = arSceneView.hitTest(location)
        
            if let hitObject = hitTest.first {
                let hitNode = hitObject.node
        
                if hitNode.isKind(of: EarthNode.self) {
                    hitNode.removeFromParentNode()
                    spawnEarthInRandomPosition()
                    timerVC.resetTimer()
                }
            }
        }
    }
}

























//if let touch = touches.first, let arSceneView = arSceneView {
//    let location = touch.location(in: arSceneView)
//    let hitTest = arSceneView.hitTest(location)
//
//    if let hitObject = hitTest.first {
//        let hitNode = hitObject.node
//
//        if hitNode.isKind(of: EarthNode.self) {
//            hitNode.removeFromParentNode()
//            spawnEarthInRandomPosition()
//        }
//    }
//}
