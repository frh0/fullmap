//
//  Mapview.swift
//  fullmap
//
//  Created by frh alshaalan on 13/05/2023.
//


import SwiftUI
import MapKit
import CoreLocation
 
struct MapView: UIViewRepresentable {
  @Binding var region: MKCoordinateRegion
    
//    func makeCoordinator() -> Coordinator {
//      Coordinator(self, context: self._context)
//    }
  func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: .zero)
  }

  func updateUIView(_ view: MKMapView, context: Context) {
    view.setRegion(region, animated: true)
  }
}

