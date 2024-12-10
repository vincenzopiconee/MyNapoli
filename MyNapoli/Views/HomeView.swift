//
//  HomeView.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 09/12/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    
    var body: some View {
        Map (position: $position) {
            UserAnnotation()
        }
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    HomeView()
}
