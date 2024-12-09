//
//  ContentView.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Lines", systemImage: "bus") {
                HomeView()
            }
            Tab("Stops", systemImage: "figure.wave") {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
