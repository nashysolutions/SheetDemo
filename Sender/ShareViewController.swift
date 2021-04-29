import UIKit
import Sheet

enum ShareType {
    case simple, tricky
}

final class ShareViewController: UIViewController {
    
    var type: ShareType = .simple
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    private lazy var sheet = Sheet(animation: type == .simple ? .fade : .custom, widthInset: 30, bottomInset: 20)
    
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sheet.chromeTapped = { [unowned self] in
            self.dismiss(animated: true)
        }
        
        observer = NotificationCenter.default.addObserver(
            forName: .dismiss,
            object: nil,
            queue: nil,
            using: { [weak self] notification in
                self?.dismiss(animated: true)
        })
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        switch type {
        case .simple: simple()
        case .tricky: tricky()
        }
    }
    
    private func simple() {
        if networkConnectionAvailable {
            let storyboard = UIStoryboard(name: "WelcomeSheet", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()!
            sheet.show(viewController, above: self)
        } else {
            showNetworkProblem()
        }
    }
    
    private func tricky() {
        if networkConnectionAvailable {
            let storyboard = UIStoryboard(name: "Sharing", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()!
            sheet.show(viewController, above: self)
        } else {
            showNetworkProblem()
        }
    }
    
    private func showNetworkProblem() {
        let message = "The internet is required to share the time with friends."
        let storyboard = UIStoryboard(name: "NetworkSheet", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! NetworkFailureViewController
        viewController.loadView()
        viewController.insert(message)
        sheet.show(viewController, above: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
