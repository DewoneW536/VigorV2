//
//  MapViewController.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/4/21.
//

import UIKit
import MapKit
import CoreLocation

//NEW PLAN!!! -
//Going to use LocalSearch (a part of MapKit) to find gyms in the area as LocalSearch
//uses natural language strings to give all places in the area with that label/description
//(i.e. coffee, gym, restuarant, etc.

//Note: MKLocalSearchRequest happens on Apple's servers remotely; not locally via the device
//Therefore device must be connected to internet/able to communicate with the servers.

//I want to implement a search bar that gives a tableView when clicked and utilizes searchNameQuery, but I also want to add annotations to
//these spots

//Creating this protocol for MKPlacemark
protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark);
}

class MapViewController: UIViewController{
    let locationManager = CLLocationManager();
    var resultSearchController:UISearchController? = nil;
    var selectedPin:MKPlacemark? = nil;
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestWhenInUseAuthorization();
        locationManager.requestLocation();
        
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable;
        resultSearchController = UISearchController(searchResultsController: locationSearchTable);
        resultSearchController?.searchResultsUpdater = locationSearchTable;
        
        let searchBar = resultSearchController!.searchBar;
        searchBar.sizeToFit();
        searchBar.placeholder = "Please enter a place or attraction.";
        navigationItem.titleView = resultSearchController?.searchBar;
        
        //Configure appearance of SearchController:
        resultSearchController?.hidesNavigationBarDuringPresentation = false;
        resultSearchController?.obscuresBackgroundDuringPresentation = true;
        definesPresentationContext = true;
        
        locationSearchTable.mapView = mapView;
        locationSearchTable.handleMapSearchDelegate = self;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        //Get rid of any resources that can be recreated.
    }
    
}
extension MapViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        if(status == .authorizedWhenInUse){
            locationManager.requestLocation();
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.first{
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05);
            let region = MKCoordinateRegion(center: location.coordinate, span: span);
            mapView.setRegion(region, animated: true);
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("error:: \(error.localizedDescription)");
    }
}
extension MapViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
        let state = placemark.administrativeArea {
            annotation.subtitle = "(city) (state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}
