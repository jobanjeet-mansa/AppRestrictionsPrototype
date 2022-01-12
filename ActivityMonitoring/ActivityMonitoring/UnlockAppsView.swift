//
//  UnlockAppsView.swift
//  ActivityMonitoring
//
//  Created by macMini_Mansa on 12/01/22.
//

import SwiftUI

struct UnlockAccess: View {
  
    var body: some View {
        
        Button("Unlock Applications") {
            print("Unlocking Access")
        }.font(.system(.largeTitle))
            .foregroundColor(.cyan)
            .border(.cyan, width: 2)
    }
}
struct UnlockAppsView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockAccess()
    }
}
