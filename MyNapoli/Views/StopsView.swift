//
//  StopsView.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 09/12/24.
//

import SwiftUI
import SwiftData
import MapKit

struct StopsView: View {
    
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @Query var stops: [Stop]
    
    
    var body: some View {
        Map(position: $position) {
            UserAnnotation()
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .mapControls {
            MapUserLocationButton()
        }
        
        
    }
}

#Preview {
    StopsView()
}
