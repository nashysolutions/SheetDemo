import UIKit
import Silver

class ContactingViewController: BaseViewController {
    
    private let container = ContainerSimulator()
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    @IBOutlet var equalWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var secondImageView: UIImageView! // is a clone of iconImageView. has zero alpha. used to keep shape on parent view. removed in viewDidAppear at which point equalWidthConstraint is activated.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        equalWidthConstraint.isActive = false
        view.layoutIfNeeded()
        Styling.ImageView.roundedCornersStyle(iconImageView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.secondImageView.removeFromSuperview()
            self.equalWidthConstraint.isActive = true
            UIView.animate(withDuration: 0.3, animations: {
                self.spinner.isHidden = false
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.didFinishAnimation(container: self.container)
            })
        })
    }
    
    func didFinishAnimation(container: CloudContainer) {
        fatalError("Must override")
    }

    let segueIDSuccess = "Connected"
    let segueIDFail = "Issue"
    
    typealias Package = (message: String, title: String, type: ProblemViewController.ProblemType, seconds: Int?)
}
