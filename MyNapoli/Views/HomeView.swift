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
        .mapStyle(.hybrid(elevation: .realistic))
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
            MapCompass()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    HomeView()
}
