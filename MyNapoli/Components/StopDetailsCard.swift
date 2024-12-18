//
//  StopDetailsCard.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 18/12/24.
//

import SwiftUI

struct StopDetailsCard: View {
    
    @State var stopName: String
    @State var stopLat: Double
    @State var stopLon: Double
    
    let onClose: () -> Void
    
    var body: some View {
    
        ZStack {
            Rectangle()
                .cornerRadius(12)
                .foregroundStyle(.gray)
                .frame(width: 300, height: 130)
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Text(stopName)
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: onClose) {
                        ZStack {
                            Circle()
                                .fill(.secondary)
                                .frame(width: 28)
                            Image(systemName: "xmark")
                        }
                    }
                }
                
                VStack (alignment: .leading) {
                    Text("Coordinate:")
                    Text("\(stopLat), \(stopLon)")
                }
                .font(.subheadline)
                
            }
            //.padding()
            .padding(.horizontal, 60)
            
        }
    }
        
}

#Preview {
    StopDetailsCard(stopName: "Test", stopLat: Double(23.45), stopLon: 22.55){
        print("Close")
    }
}
