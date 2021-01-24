//__FILENAME__  was created on __DATE__

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            Image("hexPurple8142f8")
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
