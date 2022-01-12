

import SwiftUI

struct UnlockAccess: View {
  
    var body: some View {
        
        ZStack {
            Color(UIColor.white)
            Button("  Unlock Applications  ") {
                print("Unlocking Access")
            }.font(.system(.largeTitle))
                .foregroundColor(.black)
                .border(.black, width: 2)
            .padding(.all)
        }.ignoresSafeArea()
        
    }
}

struct UnlockAccessView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockAccess()
    }
}
