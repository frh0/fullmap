//
//  File.swift
//  fullmap
//
//  Created by frh alshaalan on 13/05/2023.
//

import SwiftUI
import MapKit
import CoreLocation

class Coordinator: NSObject, CLLocationManagerDelegate  {
    var parent: ContentView
    
    init(_ parent: ContentView) {
        self.parent = parent
        
        //        init(_ parent: ContentView, context: Context) {
        //          self.parent = parent
        //          super.init()
        //    }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                parent.region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                )
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .denied || status == .restricted {
                manager.stopUpdatingLocation()
                return
            }
            
            if status == .authorizedWhenInUse {
                manager.startUpdatingLocation()
                manager.startMonitoringSignificantLocationChanges()
            }
        }
        
        
        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
            
            if let location = locations.last {
                parent.region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                )
                
                if location.speed > 0 {
                    print("User is moving")
                }
            }
        }
    }
    
    
    
}
