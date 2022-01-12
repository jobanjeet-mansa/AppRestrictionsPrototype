//
//  ActivityMonitoringApp.swift
//  ActivityMonitoring
//
//  Created by macMini_Mansa on 12/01/22.
//

import SwiftUI

@main
struct ActivityMonitoringApp: App {

    let authorizationControl = AuthorizingAppControl()
    
    let appsRestricted = UserDefaults.standard.dictionary(forKey: Constants.udRestrictedApps)
    
    var body: some Scene {
        
        WindowGroup {
            
            if !(appsRestricted?.isEmpty ?? true) {
                UnlockAccess()
            }
            else {
                AppSelection().onAppear(perform: authorizationControl.requestingAccess)
            }

        }
    }
}
