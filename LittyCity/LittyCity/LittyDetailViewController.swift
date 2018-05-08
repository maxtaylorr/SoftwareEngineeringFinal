//
//  LittyDetailViewController.swift
//  LittyCity
//
//  Created by Max Taylor on 5/1/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LittyDetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var bar: Bar?
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var dealLabel: UILabel!
    @IBOutlet weak var coverLabel: UILabel!
    @IBOutlet weak var barNameLabel: UILabel!
    @IBOutlet weak var barIconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = bar?.name
        mapView.delegate = self
        
        addressLabel.adjustsFontSizeToFitWidth = true
        dealLabel.adjustsFontSizeToFitWidth = true
        
        barIconImageView.image = bar?.barName.image
        barNameLabel.text = bar?.name
        coverLabel.text = "Cover: " + (bar?.cover)!
        dealLabel.text = "Tonight's Deal: " + (bar?.deal)!
        phoneNumberLabel.text = "Phone Number: " + (bar?.phoneNumber)!
        addressLabel.text = "Address: " + (bar?.address)!
        
        //MapKit Information
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        //Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        
        let mapAddress = bar?.address
        let geocoder = CLGeocoder()
        
        //geocoder that takes in the address of the bar, places a placemark. Then calculates the directions and creates a polyline to the destination.
        
        geocoder.geocodeAddressString(mapAddress!, in: nil, completionHandler: {(placemarks, error) -> Void in
            if error == nil {
                    if let placemark = placemarks?[0] {
                        self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
                        
                        let sourceLocation = self.locationManager.location?.coordinate
                        let destinationLocation = placemark.location!.coordinate
                        
                        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation!, addressDictionary: nil)
                        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
                        
                        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
                        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
                        
                        let sourceAnnotation = MKPointAnnotation()
                        
                        if let location = sourcePlacemark.location {
                            sourceAnnotation.coordinate = location.coordinate
                        }
                        
                        let destinationAnnotation = MKPointAnnotation()
                        destinationAnnotation.title = self.bar?.name
                        
                        if let location = destinationPlacemark.location {
                            destinationAnnotation.coordinate = location.coordinate
                        }
                        
                        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true)
                        
                        let directionRequest = MKDirectionsRequest()
                        directionRequest.source = sourceMapItem
                        directionRequest.destination = destinationMapItem
                        directionRequest.transportType = .automobile
                        
                        let directions = MKDirections(request: directionRequest)
                        
                        directions.calculate {
                            (response, error) -> Void in
                            
                            guard let response = response else {
                                if let error = error {
                                    print("Error: \(error)")
                                }
                                
                                return
                            }
                            
                            let route = response.routes[0]
                            self.mapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
                            
                            let rect = route.polyline.boundingMapRect
                            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
                        }
                }
            }
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // shows users location through use of corelocation and locationmanager
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /*
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true */
    }
    
    // creates the polyline on the mapkit
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
