import UIKit
import MapKit

internal let instanceKey = "mapManagerInstance"

public extension MKMapView {
    
    /// The instance of MapManager. A new one will be created if not exist.
    var mapManagerInstance: MapManager {
        guard let manager = self.layer.value(forKey: instanceKey) as? MapManager else {
            let manager = MapManager(map: self)
            self.layer.setValue(manager, forKey: instanceKey)
            return manager
        }
        return manager
    }
    
    public var pins: [MapPin] {
        return mapManagerInstance.pins
    }
    
    public func addPin(_ newPin: MapPin) {
        mapManagerInstance.addPin(newPin)
    }
    
    public func addPins(_ newPins: [MapPin]) {
        mapManagerInstance.addPins(newPins)
    }
    
    public func removePin(_ pinToRemove: MapPin) {
        mapManagerInstance.removePin(pinToRemove)
    }
    
    public
    func removeAll() {
        mapManagerInstance.removeAll()
    }
}
