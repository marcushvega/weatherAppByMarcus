//__FILENAME__  was created on __DATE__

import SwiftUI

struct TempRow: View {
    @State var dailyTemperatures: [Temperatures] = []
    var body: some View {
        List(dailyTemperatures) { temps in
            Text("Min Temp: ")
            let strTemp = String(temps.min)
            Text(strTemp)
            Spacer()
            
        }
    }
}

struct TempRow_Previews: PreviewProvider {
    static var previews: some View {
        TempRow()
    }
}
