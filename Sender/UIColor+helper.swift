import UIKit

extension UIColor {
    
    func imageRepresentation(_ bounds: CGRect) -> UIImage {
        return UIGraphicsImageRenderer(size: bounds.size).image { _ in
            self.setFill()
            UIRectFill(bounds)
        }
    }
}
