import Foundation
import FamilyControls

class AuthorizingAppControl {
    func requestingAccess() {
        AuthorizationCenter.shared.requestAuthorization { result in
            switch result {
            case .success():
                print("App control authorization successful")
            case .failure(let error):
                print("Authorization failed with error \(error.localizedDescription)")
            }
        }
    }
}
