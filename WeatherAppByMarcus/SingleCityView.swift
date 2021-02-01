//__FILENAME__  was created on __DATE__

import SwiftUI

struct SingleCityView: View {
    @State var weather: Weather?
    
    var city: City
    
    var body: some View {
        VStack {
        	Text(verbatim: city.name)
                .bold()
                .font(.system(size: 32))
            	.onAppear(perform: {
                	let forThisUseOnly: SomeClass = SomeClass.init()
                	forThisUseOnly.setLonLat(longitude: city.lon, latitude: city.lat)
                	forThisUseOnly.processWeatherJSON { (weather) in
                    	self.weather = weather
            		}
        		})
            Spacer()
            
            HStack {
                Spacer()
                VStack {
                    if let unwrap = weather {
                        Text("Current")
                        Text("\(getFormattedTemperature(temperature: unwrap.current.temp))F")
                            .font(.system(size: 42))
                    }
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            
            Spacer()
            if let unwrapped = weather {
                TempList(dailyWeather: unwrapped)
            }
        }
    }
}

func getFormattedTemperature(temperature: Double) -> String {
    let temperature = Measurement(value: temperature, unit: UnitTemperature.fahrenheit)
    let measurementFormatter = MeasurementFormatter()
    measurementFormatter.unitStyle = .short
    measurementFormatter.numberFormatter.maximumFractionDigits = 0
    measurementFormatter.unitOptions = .naturalScale
    
    return measurementFormatter.string(from: temperature)
}

struct SingleCityView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCityView(city: cityRows[0])
    }
}
