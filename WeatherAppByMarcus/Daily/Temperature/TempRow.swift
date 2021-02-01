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
                
                Text(verbatim: getFormattedTemperature(temperature: dailyTemperature.min)+"F")
                Spacer()
                
                Text("Max: ")
                    .alignmentGuide(.trailing, computeValue: { d in d[.trailing] })
                Text(verbatim: getFormattedTemperature(temperature: dailyTemperature.max)+"F")
                Spacer()
            }
        }
        
    }
}

//func getFormattedTemperature(temperature: Double) -> String {
//    let temperature = Measurement(value: temperature, unit: UnitTemperature.fahrenheit)
//    let measurementFormatter = MeasurementFormatter()
//    measurementFormatter.unitStyle = .short
//    measurementFormatter.numberFormatter.maximumFractionDigits = 0
//    measurementFormatter.unitOptions = .naturalScale
//
//    return measurementFormatter.string(from: temperature)
//}

//struct TempRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TempRow()
//    }
//}
