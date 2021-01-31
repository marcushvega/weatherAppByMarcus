//__FILENAME__  was created on __DATE__

import SwiftUI

struct TempRow: View {
    let epochTime: Int
    var dailyTemperature: Temperatures
    var body: some View {
        VStack {
            HStack {
                // insert timestamp here
                // change epoch time to human-readable format
                
                let dt: String = SomeClass().changeEpochTimeToHumanReadable(epochTime: epochTime)
                
                Text("\(dt)")
                
                Spacer()
                Text("Min: ")
                    .alignmentGuide(.leading, computeValue: { d in d[.leading] })
                
                Text(verbatim: String(dailyTemperature.min))
                Spacer()
                
                Text("Max: ")
                    .alignmentGuide(.trailing, computeValue: { d in d[.trailing] })
                Text(verbatim: String(dailyTemperature.max))
                Spacer()
            }
        }
        
    }
}

//struct TempRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TempRow()
//    }
//}
