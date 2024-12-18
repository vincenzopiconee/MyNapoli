//
//  LinesView.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 09/12/24.
//

import SwiftUI
import SwiftData

struct LinesView: View {
    // Utilizzo di SwiftData per caricare tutte le rotte
    @Query private var routes: [Route]
    
    // Stato per il tipo di percorso selezionato nel picker
    @State private var selectedType: Int = 3
    
    // Stato per il testo della ricerca
    @State private var searchText: String = ""

    // Raggruppiamo le rotte per tipo (routeType)
    var groupedRoutes: [Int: [Route]] {
        Dictionary(grouping: routes, by: { $0.routeType })
    }

    // Filtriamo le rotte in base al tipo selezionato e al testo di ricerca
    var filteredRoutes: [Route] {
        let routesByType = groupedRoutes[selectedType, default: []]
        
        if searchText.isEmpty {
            // Se la ricerca è vuota, ritorniamo tutte le rotte per il tipo selezionato
            return routesByType
        } else {
            // Filtriamo in base al nome breve della rotta
            return routesByType.filter { route in
                route.routeShortName.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                // Segmented Picker per selezionare il tipo di percorso
                Picker("Select Route Type", selection: $selectedType) {
                    Text("Bus").tag(3)
                    Text("Metro").tag(1)
                    Text("Funicolar").tag(7)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Lista delle rotte filtrate per tipo e ricerca
                List(filteredRoutes, id: \.routeID) { route in
                    Text(route.routeShortName) // Mostra il nome breve della rotta
                        .font(.headline) // Impostiamo il font per ogni elemento della lista
                }
                .searchable(text: $searchText) // Aggiunge la barra di ricerca
            }
            .navigationTitle("Routes")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Preview della vista
#Preview {
    LinesView()
}
