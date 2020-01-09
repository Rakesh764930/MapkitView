//
//  ViewController.swift
//  Map Demo
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //define latitude and longitude
        let latitude:CLLocationDegrees=43.64
        let longitude:CLLocationDegrees = -79.38
        
        //define delta latitude and longitude
        let latDelta:CLLocationDegrees=0.05
        let longDelta:CLLocationDegrees=0.05
        
        //define span
        let span=MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        //define location
        let loaction = CLLocationCoordinate2D(latitude:latitude,longitude:longitude)
        
        //define the region
        let region = MKCoordinateRegion(center: loaction, span: span)
        
        //set the region on the map
        mapView.setRegion(region, animated: true)
        
        //adding annotation for the map
        let annotation = MKPointAnnotation()
        annotation.title="Toronto City"
        annotation.subtitle="City of dreams"
        annotation.coordinate=loaction
        mapView.addAnnotation(annotation)
        
        //add long press gesture
        let uilpgr=UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        mapView.addGestureRecognizer(uilpgr)
        
        }
    @objc func longPress(gestureRecognizer: UIGestureRecognizer){
          let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            
            let annotation = MKPointAnnotation()
            annotation.title = "place to visit"
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
    }

}

