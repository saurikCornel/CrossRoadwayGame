import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CrossAwaitingResourceManager(url: URL(string: "https://crossroadway.top/load")!)
    
    var body: some View {
        GeometryReader { geo in
            СrossHolder(viewModel: viewModel)
                .onReceive(NotificationCenter.default.publisher(for: .networkStatusChanged)) { notification in
                    if let isConnected = notification.object as? Bool {
                        viewModel.updateNetworkStatus(isConnected)
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
        }
        .background(
            
            Color(hex: 0x262b5e)
                .ignoresSafeArea()
        )
    }
}

