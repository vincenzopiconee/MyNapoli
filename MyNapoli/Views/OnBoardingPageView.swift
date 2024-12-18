//
//  OnBoardingView.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 10/12/24.
//

import SwiftUI

struct OnBoardingPageView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack (spacing: 100){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Text(description)
                .padding()
                .multilineTextAlignment(.center)
                .padding()
            
        }
    }
}

#Preview {
    OnBoardingPageView(title: "Welcome", description: "Find all the details you need to navigate Napoli’s public transport system effortlessly")
}
