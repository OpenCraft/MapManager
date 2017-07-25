import UIKit
import MapKit

open class MapManager: NSObject {
    
    // MARK: Properties
    
    fileprivate let map: MKMapView
    open private(set) var pins = [MapPin]()
    
    // MARK: Init
    
    public init(map: MKMapView) {
        self.map = map
        super.init()
        self.map.delegate = self
    }
    
    // MARK: Methods
    
    
    open func addPin(_ newPin: MapPin) {
        pins.append(newPin)
        map.addAnnotation(newPin)
    }
    
    open func addPins(_ newPins: [MapPin]) {
        pins.append(contentsOf: newPins)
        map.addAnnotations(newPins)
    }
    
    open func removePin(_ pinToRemove: MapPin) {
        if let index = pins.index(of: pinToRemove) {
            pins.remove(at: index)
            map.removeAnnotation(pinToRemove)
        }
    }
    
    open func removeAll() {
        pins.removeAll()
        map.removeAnnotations(map.annotations)
    }
}

extension MapManager: MKMapViewDelegate {
    open func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        if let pin = annotation as? MapPin {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) ?? MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.annotation = annotation
            annotationView.image = pin._image
            annotationView.centerOffset = pin._imageOffset
            return annotationView
        }
        return nil
    }
    
    open func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let pin = view.annotation as? MapPin {
            pin._didSelect?(pin, mapView, view)
        }
    }
    
    open func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if let pin = view.annotation as? MapPin {
            pin._didDeselect?(pin, mapView, view)
        }
    }
}
