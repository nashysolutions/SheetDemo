import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Styling.ControllerRootView.roundedCornersStyle(view)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}
