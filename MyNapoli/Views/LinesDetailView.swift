//
//  LinesDetailView.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 09/12/24.
//

import SwiftUI
import MapKit

struct LinesDetailView: View {
    
    let route: Route
    
    var body: some View {
        NavigationStack {
            Map {
                
            }
            .navigationTitle(route.routeShortName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LinesDetailView(route: Route(routeID: "1", agencyID: "1", routeShortName: "C16", routeType: 3))
}
