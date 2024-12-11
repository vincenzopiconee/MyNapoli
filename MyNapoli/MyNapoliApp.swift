//
//  MyNapoliApp.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 09/12/24.
//

import SwiftUI
import SwiftData


@main
struct MyNapoliApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Stop.self, Route.self])
                
        }
    }
}
