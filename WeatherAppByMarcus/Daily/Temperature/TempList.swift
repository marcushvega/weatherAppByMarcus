//__FILENAME__  was created on __DATE__

import SwiftUI

struct TempList: View {
    var dailyWeather: Weather
    var body: some View {
        VStack {
            Text("Minimum & Maximum Temperatures")
            List(dailyWeather.daily) { weather in
                TempRow(epochTime: weather.dt, dailyTemperature: weather.temp)
            }
        }
    }
}

//struct TempList_Previews: PreviewProvider {
//    static var previews: some View {
//        TempList()
//    }
//}
