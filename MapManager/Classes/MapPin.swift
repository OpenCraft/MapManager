import UIKit
import MapKit

public class MapPin: NSObject {
    
    public typealias Selection = (MapPin, MKMapView, MKAnnotationView) -> Void
    
    // MARK: Private Properties
    
    let id = NSObject()
    let _coordinate: CLLocationCoordinate2D
    var _image: UIImage?
    var _imageOffset = CGPoint.zero
    var _didSelect: Selection?
    var _didDeselect: Selection?
    
    public init(at coordinate: CLLocationCoordinate2D) {
        _coordinate = coordinate
    }
    
    // MARK: Methods
    
    @discardableResult
    public func setImage(_ image: UIImage, offSet: OffSet = .center) -> MapPin {
        _image = image
        _imageOffset = offSet.point(basedOn: image.size)
        return self
    }
    
    @discardableResult
    public func setDidSelect(_ didSelect: @escaping Selection) -> MapPin {
        _didSelect = didSelect
        return self
    }
    
    @discardableResult
    public func setDidDeselect(_ didDeselect: @escaping Selection) -> MapPin {
        _didDeselect = didDeselect
        return self
    }
}

// MARK: - OffSet Enum

extension MapPin {
    public enum OffSet {
        case center
        case centerTop
        case centerBottom
        case custom(CGPoint)
        
        func point(basedOn size: CGSize) -> CGPoint {
            switch self {
            case .center:
                return .zero
            case .centerTop:
                return CGPoint(x: 0, y: size.height/2)
            case .centerBottom:
                return CGPoint(x: 0, y: size.height/2 * -1)
            case .custom(let point):
                return point
            }
        }
    }
}

// MARK: - MKAnnotation

extension MapPin: MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return _coordinate
    }
}
