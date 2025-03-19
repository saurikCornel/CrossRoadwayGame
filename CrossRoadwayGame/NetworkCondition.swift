//
//  NetworkStatusManager.swift
//  CrossRoadwayGame
//
//  Created by alex on 3/19/25.
//

import Foundation
import Network

class NetworkCondition {
    static let shared = NetworkCondition()
    private let monitor = NWPathMonitor()
    private var isNetworkAvailable: Bool = true
    
    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            let isConnected = path.status == .satisfied
            self?.isNetworkAvailable = isConnected
            debugPrint("Network status updated: \(isConnected ? "Connected" : "Disconnected")")
            NotificationCenter.default.post(name: .networkStatusChanged, object: isConnected)
        }
        monitor.start(queue: DispatchQueue.global(qos: .background))
    }
    
    func isConnected() -> Bool {
        return isNetworkAvailable
    }
}

extension Notification.Name {
    static let networkStatusChanged = Notification.Name("networkStatusChanged")
}
