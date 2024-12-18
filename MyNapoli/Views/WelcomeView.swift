//
//  WelcomeView.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 10/12/24.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    
    @Environment(\.modelContext) var modelContext

    @Binding var isOnboardingComplete: Bool
    @State private var currentPage = 0
    
    let titles = ["Welcome", "Get Started", "Enjoy MyNapoli"]
    let descriptions = [
        "Find all the details you need to navigate Napoli’s public transport system effortlessly",
        "Explore features designed to make your travel in Napoli easy and enjoyable",
        "Access real-time updates and plan your trips with confidence and convenience"
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<titles.count, id: \.self) { index in
                    OnBoardingPageView(title: titles[index], description: descriptions[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            
            // Button logic based on current page
            if currentPage < titles.count - 1 {
                Button(action: {
                    withAnimation{
                        currentPage += 1
                    }
                    
                }, label: {
                    Text("Next")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                })
                .buttonStyle(.borderedProminent)
                .padding()
            } else {
                Button(action: {
                    isOnboardingComplete.toggle()
                    saveStopsToContainer()
                    saveRoutesToContainer()
                    
                }, label: {
                    Text("Continue")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                })
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .interactiveDismissDisabled()
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .label
            UIPageControl.appearance().pageIndicatorTintColor = .secondaryLabel
        }
    }
    
    func saveStopsToContainer() {
        
        let stops = loadStops(fromFile: "stops")
        
        for stop in stops {
            modelContext.insert(stop)
        }
        
        do {
            try modelContext.save()
            print("Tutti i dati delle fermate sono stati salvati con successo.")
        } catch {
            print("Errore durante il salvataggio: \(error)")
        }
    }
    
    func saveRoutesToContainer() {
        
        let routes = loadRoutes(fromFile: "routes")
        
        for route in routes {
            modelContext.insert(route)
        }
        
        do {
            try modelContext.save()
            print("Tutti i dati delle linee sono stati salvati con successo.")
        } catch {
            print("Errore durante il salvataggio: \(error)")
        }
        
    }
}

#Preview {
    WelcomeView(isOnboardingComplete: .constant(true))
}
