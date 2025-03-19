//
//  PreloaderContainer.swift
//  CrossRoadwayGame
//
//  Created by alex on 3/19/25.
//

import Foundation
import SwiftUI
import WebKit

struct AwaitingResourcesHolder: View {
    @StateObject var viewModel: GameAwaitingResourceManager
    
    init(viewModel: GameAwaitingResourceManager) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            GameView(viewModel: viewModel)
                .opacity(viewModel.loadingState == .loaded ? 1 : 0.5)
            
            if case .loading(let progress) = viewModel.loadingState {
                GeometryReader { geo in
                    AwaitingResourcesView(progress: progress)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .background(Color.black)
                }
            } else if case .failed(let error) = viewModel.loadingState {
                Text("Err: \(error.localizedDescription)")
                    .foregroundColor(.red)
            } else if case .noInternet = viewModel.loadingState {
                Text("")
            }
        }
    }
}
