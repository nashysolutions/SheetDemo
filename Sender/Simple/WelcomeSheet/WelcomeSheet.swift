import UIKit

final class WelcomeSheetViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            Styling.ImageView.roundedCornersStyle(iconImageView)
        }
    }
    
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            Styling.Button.filledStyle(startButton)
        }
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "CompleteSheet", bundle: nil).instantiateInitialViewController()!
        show(viewController, sender: self)
    }
    
    @IBOutlet weak var iconImageViewContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        iconImageViewContainerView.isHidden = (traitCollection.verticalSizeClass == .compact)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        iconImageViewContainerView.isHidden = (newCollection.verticalSizeClass == .compact)
        coordinator.animate(alongsideTransition: { [unowned self] _ in
            self.view.layoutIfNeeded()
        }, completion: nil)
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
