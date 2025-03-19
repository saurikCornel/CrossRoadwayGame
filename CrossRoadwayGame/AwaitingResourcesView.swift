//
//  PreloaderView.swift
//  CrossRoadwayGame
//
//  Created by alex on 3/19/25.
//

import Foundation
import SwiftUI

struct AwaitingResourcesView: View {
    var progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack {
                    Image(.left)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width * 0.1, height: geometry.size.height)
                    Spacer()
                    Image(.right)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width * 0.1, height: geometry.size.height)
                    
                }
                
                VStack(spacing: 20) {
                    
                    
                    
                    
                    Image(.text)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.8)
                    
                    Image(.mrchicken)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.8)
                    
                    
                    
                    
                    Spacer()
                    
                    ZStack {
                        
                        
                        
                        
                        VStack {
                            ZStack {
                                Text("Loading: \(Int(progress * 100))%")
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundStyle(
                                        LinearGradient(
                                            colors: [.white],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .shadow(color: .orange.opacity(0.3), radius: 2, x: 0, y: 1)
                            }
                        }
                    }
                    .frame(width: geometry.size.width - 40) 
                    
                    
                    
                    
                    Spacer()
                }
            }
            .frame(width: geometry.size.width)
            .background(
                Image(.back)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    AwaitingResourcesView(progress: 0.75)
}
