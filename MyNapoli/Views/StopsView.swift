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
    
    @State private var selectedStop: Stop?
    
    @State private var searchText: String = ""
    
    @State private var showSearch: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $position) {
                    // Aggiungi marker 3D per ogni fermata
                    ForEach(stops, id: \.stopID) { stop in
                        
                        Annotation(
                            stop.stopName, // Nome fermata per identificare l'annotazione
                            coordinate: CLLocationCoordinate2D(latitude: stop.stopLat, longitude: stop.stopLon)
                        ) {
                            // Contenuto del marker
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.blue)
                                Image(systemName: "bus.fill")
                                    .font(.callout)
                                    .foregroundStyle(.black, .white)
                                
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedStop = stop
                                }
                            }
                            
                        }
                        
                    }
                    
                    UserAnnotation()
                }
                .mapStyle(.hybrid(elevation: .realistic))
                .mapControls {
                    MapUserLocationButton()
                    MapCompass() // Aggiunge una bussola alla mappa
                    MapPitchToggle() // Consente di regolare l'angolo della mappa in 3D
                }
                
                
                if let stop = selectedStop {
                    VStack {
                        Spacer()
                        
                        StopDetailsCard(stopName: stop.stopName, stopLat: stop.stopLat, stopLon: stop.stopLon) {
                            
                            withAnimation {
                                selectedStop = nil
                            }
                        }
                        .padding(.bottom)
                        
                    }
                    
                }
                
            }
            .navigationTitle("Stops")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, isPresented: $showSearch)
        }
        
    }
}

#Preview {
    StopsView()
}
