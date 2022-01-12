

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

struct UnlockAccessView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockAccess()
    }
}
