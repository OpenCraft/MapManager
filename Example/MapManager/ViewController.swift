//
//  ViewController.swift
//  MapManager
//
//  Created by Henrique Morbin on 07/23/2017.
//  Copyright (c) 2017 Henrique Morbin. All rights reserved.
//

import UIKit
import MapKit
import MapManager

class ViewController: UIViewController {

    var map = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.frame = CGRect(origin: .zero, size: view.frame.size)
        map.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(map)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let pin = MapPin(at: self.map.centerCoordinate)
                .setImage(#imageLiteral(resourceName: "starkIcon"), offSet: .centerBottom)
                .setDidSelect { _, _, annotationView in
                    annotationView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                }.setDidDeselect { _, _, annotationView in
                    annotationView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            
            self.map.addPin(pin)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.map.selectAnnotation(pin, animated: true)
            }
        }
    }
}
