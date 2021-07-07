//
//  ViewController.swift
//  ShareLocation
//
//  Created by PrincePhoenix on 07.07.2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet var map: MKMapView!
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var blurContainer: UIVisualEffectView!
    @IBOutlet var blurButtonContainer: UIVisualEffectView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Setup blur containers
        blurContainer.layer.cornerRadius = 25
        blurContainer.layer.masksToBounds = true
        blurButtonContainer.layer.cornerRadius = 25
        blurButtonContainer.layer.masksToBounds = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        map.setRegion(region, animated: true)
        
        addPin(at: coordinate)
        updateLocationLabel(with: coordinate)
    }
    
    func addPin(at coordinate: CLLocationCoordinate2D) {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        map.addAnnotation(pin)
    }
    
    func updateLocationLabel(with coordinate: CLLocationCoordinate2D) {
        let firstLine = "My location:\n"
        let secondLine = String(format: "Latitude: %.2f\n", coordinate.latitude)
        let thirdLine = String(format: "Longtitude: %2.f", coordinate.longitude)
        let text = firstLine + secondLine + thirdLine
        locationLabel.text = text
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.startUpdatingLocation()
            
            render(location)
        }
    }
}
