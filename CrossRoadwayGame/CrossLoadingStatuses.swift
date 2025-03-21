
import Foundation

enum CrossLoadingStatuses: Equatable {
    case idle
    case loading(progress: Double)
    case loaded
    case failed(Error)
    case noInternet
    
    static func == (lhs: CrossLoadingStatuses, rhs: CrossLoadingStatuses) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loaded, .loaded), (.noInternet, .noInternet):
            return true
        case (.loading(let lp), .loading(let rp)):
            return lp == rp
        case (.failed, .failed):
            return true
        default:
            return false
        }
    }
}
