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
            ZStack {
                Map {
                    
                }
                .navigationTitle(route.routeShortName)
                .navigationBarTitleDisplayMode(.inline)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 60, height: 60)
                        Image(systemName: "exclamationmark.triangle")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
                .padding()
                .padding(.leading, 300)
            }
            
        }
    }
}

#Preview {
    LinesDetailView(route: Route(routeID: "1", agencyID: "1", routeShortName: "C16", routeType: 3))
}
