//__FILENAME__  was created on __DATE__

import Foundation
import Alamofire

let cityRows: [City] = processJSONData(filename: "cities.json")

private func bs() {
    let parameters = ["lat": "33.441792", "lon": "-94.037689", "units": "imperial", "exclude": "hourly,minutely", "appid": "a9535ee273662ee0990a9f796f4678a5"]
    
    AF.request("https://api.openweathermap.org/data/2.5/onecall", parameters: parameters).response { (response) in
        debugPrint(response)
        guard let data = response.data else {return}
        
        do {
            let daily = JSONDecoder()
            let dailies = try daily.decode(Weather.self, from: data)
            print("dailies == \(dailies)")
            
        }
        catch {
            fatalError("LOOK AT THIS ERROR:\n\(error)")
        }
    }
}

private func processJSONData<T: Decodable>(filename: String) -> T {
    
    bs()
    
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    	else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Couldn't load \(filename) from main bunle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


