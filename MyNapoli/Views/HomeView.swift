//
//  HomeView.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 09/12/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @State private var searchText: String = ""
    
    @State private var showSearch: Bool = false
    
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
        NavigationStack {
            Map (position: $position) {
                
                ForEach (searchResults, id: \.self) { mapItem in
                    let placeMark = mapItem.placemark
                    Marker (mapItem.name ?? "Place", coordinate: placeMark.coordinate)
                        .tint(.accent)
                    
                }
                
                UserAnnotation()
            }
            .mapStyle(.hybrid(elevation: .realistic))
            .mapControls {
                MapUserLocationButton()
                MapPitchToggle()
                MapCompass()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, isPresented: $showSearch)
            .onAppear {
                CLLocationManager().requestWhenInUseAuthorization()
            }
        }
        .onSubmit(of: .search){
            Task {
                guard !searchText.isEmpty else { return }
                await searchPlaces()
            }
        }
        
    }
    
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        
        let results = try? await MKLocalSearch(request: request).start()
        searchResults = results?.mapItems ?? []
    }
    
    
}

#Preview {
    HomeView()
}



