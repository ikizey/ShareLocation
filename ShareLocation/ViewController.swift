//
//  ViewController.swift
//  ShareLocation
//
//  Created by PrincePhoenix on 07.07.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet var map: MKMapView!
    
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var blurContainer: UIVisualEffectView!
    @IBOutlet var blurButtonContainer: UIVisualEffectView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Setup blur containers
        blurContainer.layer.cornerRadius = 25
        blurContainer.layer.masksToBounds = true
        blurButtonContainer.layer.cornerRadius = 25
        blurButtonContainer.layer.masksToBounds = true
        
        
    }

    @IBAction func shareButtonTapped(_ sender: UIButton) {
    }
    
}

