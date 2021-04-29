import UIKit

// https://www.pointfree.co/episodes/ep3-uikit-styling-with-functions
precedencegroup SingleTypeComposition {
    associativity: right
}

infix operator <> : SingleTypeComposition
func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}

struct Styling {
    
    struct Button {
        
        private static let baseStyle: (UIButton) -> Void = {
            $0.setTitleColor(.white, for: .normal)
            $0.setTitleColor(color1, for: .highlighted)
        }
        
        private static let roundedCornersStyle: (UIButton) -> Void = {
            $0.clipsToBounds = true
            let width = $0.bounds.width
            $0.layer.cornerRadius = width * 0.05
        }
        
        private static let roundedButtonStyle =
            baseStyle <>
            roundedCornersStyle
        
        static let filledStyle = roundedButtonStyle <> {
            $0.setBackgroundImage(color1.imageRepresentation($0.bounds), for: .normal)
            $0.setBackgroundImage(color2.imageRepresentation($0.bounds), for: .highlighted)
        }
    }

    struct ImageView {
        
        static let roundedCornersStyle: (UIImageView) -> Void = {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = $0.bounds.width * 0.05
        }
    }
    
    struct ControllerRootView {
        
        static let roundedCornersStyle: (UIView) -> Void = {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = $0.bounds.width * 0.1
        }
    }
}

extension NSMutableAttributedString {
    
    @discardableResult
    func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: font2]
        append(NSMutableAttributedString(string: text, attributes: attrs))
        return self
    }
    
    @discardableResult
    func normal(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: font1]
        append(NSAttributedString(string: text, attributes: attrs))
        return self
    }
}
