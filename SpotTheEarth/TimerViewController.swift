import UIKit

extension UIViewController {
    
    func add(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }
}

class TimerViewController: UIViewController {
    
    private static let kInitialTimeSec = 10
    
    private var seconds = TimerViewController.kInitialTimeSec
    private var timer: Timer?
    private lazy var timeLeftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 260.0)
        label.textColor = .white
        label.alpha = 0.4
        label.text = String(seconds)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTimeLeftLabel()
        configureTimer()
    }
    
    func resetTimer() {
        seconds = TimerViewController.kInitialTimeSec
    }
    
    private func configureTimeLeftLabel() {
        let ignoreTouchView = IgnoreTouchView()
        ignoreTouchView.frame = view.frame
        self.view = ignoreTouchView
        view.addSubview(timeLeftLabel)
        timeLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLeftLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeLeftLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func configureTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTimeLabel),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func updateTimeLabel() {
        let timeLeftText = max(seconds, 0) == 0 ? ":(" : String(seconds)
        timeLeftLabel.text = "\(timeLeftText)"
        seconds -= 1
    }
    
    private class IgnoreTouchView : UIView {
        override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            let hitView = super.hitTest(point, with: event)
            
            if hitView == self {
                return nil
            }
            
            return hitView
        }
    }
}
