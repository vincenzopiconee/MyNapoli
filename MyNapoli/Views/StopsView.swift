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
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @Query private var stops: [Stop]
    
    var body: some View {
        Map(position: $position) {
            // Aggiungi marker 3D per ogni fermata
            ForEach(stops, id: \.stopID) { stop in
                Annotation(
                    stop.stopName, // Nome fermata per identificare l'annotazione
                    coordinate: CLLocationCoordinate2D(latitude: stop.stopLat, longitude: stop.stopLon)
                ) {
                    // Contenuto del marker
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundStyle(.blue, .white)
                        
                        Text(stop.stopName)
                            .font(.caption)
                            .padding(4)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(4)
                    }
                    .accessibilityElement()
                    .accessibilityLabel("\(stop.stopName)")
                    .accessibilityHint("Fermata con latitudine \(stop.stopLat) e longitudine \(stop.stopLon)")
                }
                .annotationTitles(.automatic) // Mostra automaticamente il nome fermata durante l'interazione
            }
            
            UserAnnotation()
        }
        .mapStyle(.standard(elevation: .realistic))
        .mapControls {
            MapUserLocationButton()
            MapCompass() // Aggiunge una bussola alla mappa
            MapPitchToggle() // Consente di regolare l'angolo della mappa in 3D
        }
    }
}

#Preview {
    StopsView()
}
