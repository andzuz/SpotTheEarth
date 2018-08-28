import SceneKit

extension SCNVector3 {
    
    private static func randomPosition(lower: Float, upper: Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    static var random: SCNVector3 {
        return SCNVector3(
            randomPosition(lower: -1.5, upper: 1.5),
            randomPosition(lower: -1.5, upper: 1.5),
            -1.0)
    }
}
