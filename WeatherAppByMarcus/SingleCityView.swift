//__FILENAME__  was created on __DATE__

import SwiftUI

struct SingleCityView: View {
    @State var weather: Weather?
    
    var city: City
    
    var body: some View {
        VStack {
        	Text(verbatim: city.name)
            	.onAppear(perform: {
                	let forThisUseOnly: SomeClass = SomeClass.init()
                	forThisUseOnly.setLonLat(longitude: city.lon, latitude: city.lat)
                	forThisUseOnly.processWeatherJSON { (weather) in
                    	self.weather = weather
            		}
        		})
            
        }
    }
}

struct SingleCityView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCityView(city: cityRows[0])
    }
}
