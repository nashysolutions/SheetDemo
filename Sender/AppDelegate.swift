import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var rootViewController: UINavigationController {
        return window!.rootViewController as! UINavigationController
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let textColor = UIColor.black
        UINavigationBar.appearance().tintColor = textColor
        UINavigationBar.appearance().barTintColor = .darkGray
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: textColor]
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        NotificationCenter.default.post(
            name: .dismiss,
            object: self,
            userInfo: [dismissSheetAnimatedKey : false]
        )
        rootViewController.popToRootViewController(animated: false)
    }
}

let color1 = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
let color2 = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)

let dismissSheetAnimatedKey = "keyDismissSheetAnimated"
let font1 = UIFont(name: "AvenirNext-Medium", size: 17).require(hint: "The fonts have been ripped out of the project. Hmm...")
let font2 = UIFont(name: "AvenirNext-DemiBold", size: 17).require(hint: "The fonts have been ripped out of the project. Hmm...")

extension Notification.Name {
    static let dismiss = Notification.Name(rawValue: "Dismiss")
}
