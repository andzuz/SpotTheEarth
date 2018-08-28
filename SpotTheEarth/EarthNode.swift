import Foundation
import SceneKit

class EarthNode: SCNNode {
    
    override init() {
        super.init()
        geometry = SCNSphere(radius: 0.4)
        geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earth")
        
        let rotateAction = SCNAction.rotateBy(x: 0.0, y: CGFloat(Float.pi), z: 0.0, duration: 4.0)
        let repeatedRotateAction = SCNAction.repeatForever(rotateAction)
        runAction(repeatedRotateAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
