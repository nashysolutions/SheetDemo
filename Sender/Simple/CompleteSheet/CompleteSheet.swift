import UIKit

final class CompleteSheetViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            Styling.ImageView.roundedCornersStyle(iconImageView)
        }
    }
    
    @IBOutlet weak var finishButton: UIButton! {
        didSet {
            Styling.Button.filledStyle(finishButton)
        }
    }
    
    @IBAction func finishButtonPressed(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: .dismiss,
            object: nil,
            userInfo: [dismissSheetAnimatedKey : true]
        )
    }
    
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
