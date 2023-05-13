//
//  ContentView.swift
//  fullmap
//
//  Created by frh alshaalan on 13/05/2023.
//

import SwiftUI
import MapKit
import CoreLocation



struct ContentView: View {
  @State  var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 24.7136, longitude: 46.6753),
    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
  )
    

    @State  var locationManager = CLLocationManager()

  var body: some View {
    MapView(region: $region)
        .onAppear {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = Coordinator(self)
            locationManager.startUpdatingLocation()
            locationManager.startMonitoringSignificantLocationChanges()
        }.ignoresSafeArea()
  }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





