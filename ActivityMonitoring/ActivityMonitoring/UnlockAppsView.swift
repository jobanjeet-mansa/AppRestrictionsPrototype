

import SwiftUI

struct UnlockAccess: View {
    
    @State var timerStarted: Bool = false
    var body: some View {
        
        ZStack {
            Color(UIColor.white)
            Button("  Unlock Applications  ") {
                timerStarted.toggle()
            }.font(.system(size: 35))
                .foregroundColor(.black)
              //  .border(.black, width: 0.5)
                .sheet(isPresented: $timerStarted) {
                    TimerView()
                }

        }.ignoresSafeArea()
    }
}



struct TimerView: View {
    @State var timeRemaining = 120
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        let time = secondsToMinutesSeconds(timeRemaining)
        
        if timeRemaining > 0 {
        Text("Locking apps in \(time.0):\(time.1)")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
                
            }.font(.system(size: 35))
    }
        else {
            UnlockAccess.init(timerStarted: false)
        }
}
}


struct UnlockAccessView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockAccess()
    }
}
