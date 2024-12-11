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
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical, 50)
            Text(description)
                .padding()
                .multilineTextAlignment(.center)
                .padding(.vertical, 50)
            
        }
    }
}

#Preview {
    OnBoardingPageView(title: "Welcome", description: "here to explore MyNapoli :)")
}
