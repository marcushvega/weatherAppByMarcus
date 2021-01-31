//__FILENAME__  was created on __DATE__

import Foundation
import Alamofire

//let dailyRows: [Weather] = processWeatherJSON(city: "Detroit")
//let weeklyWeather: Weather = processWeatherJSON(city: "Detroit")

class SomeClass {
    private var longitude: Double = 0.0
    private var latitude: Double = 0.0
    
    func setLonLat(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
    
    func processWeatherJSON(returnMyWeather: @escaping (Weather) -> ()) {
    	let parameters = ["lat": String(latitude), "lon": String(longitude), "units": "imperial", "exclude": "hourly,minutely", "appid": "49fa03f8287ea3774b8ad46a17f8ae8f"]
    
   		AF.request("https://api.openweathermap.org/data/2.5/onecall", parameters: parameters).response { (response) in
        	debugPrint(response)
        	guard let data = response.data else {return}
        
        	do {
          	  	let decodeTheStuff = JSONDecoder()
            	let sevenDayWeather = try decodeTheStuff.decode(Weather.self, from: data)
//            	print("weeklyWeather == \(weeklyWeather)")		this is here for debugging purposes
            
            	// this apparently allows us to interact with the app while running the api call
            	DispatchQueue.main.async {
                	// makes the json be able to be sent somewhere outside of the AF request
                	returnMyWeather(sevenDayWeather)
            	}
        	}
        	catch {
            	fatalError("LOOK AT THIS ERROR:\n\(error)")
        	}
        }
    }
    
    func changeEpochTimeToHumanReadable(epochTime: Int) -> String {
        // insert timestamp here
        // change epoch time to human-readable format
        let date = Date(timeIntervalSince1970: TimeInterval(epochTime))
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.setLocalizedDateFormatFromTemplate("MMMMd")
        
        return df.string(from: date)
    }

}
