//
//  ViewController.swift
//  Maps
//
//  Created by Hitesh V-PI on 09/06/17.
//  Copyright © 2017 Pixabit Infotech. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.showsUserLocation = true

        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
           // locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
        }
        
        /*
        let location = CLLocationCoordinate2DMake(23.0329, 72.5327)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "IIM"
        annotation.subtitle = "Vastrapur Ahmedabad"
        map.addAnnotation(annotation)
        
        */
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        _ = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        let region = MKCoordinateRegionMakeWithDistance((location?.coordinate)!, 200, 200)
        
        self.map.setRegion(map.regionThatFits(region), animated: true)
    }


}

