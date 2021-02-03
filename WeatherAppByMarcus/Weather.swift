//__FILENAME__  was created on __DATE__

import Foundation

struct Weather: Codable, Hashable {
    var daily: Array<Daily>
    var current: CurrentWeatheryItems
}

struct Daily: Codable, Hashable {
    var dt: Int 		// time in UNIX UTC
    var sunrise: Int	// time of sunrise
    var sunset: Int		// time of sunset
    var temp: Temperatures

}

struct Temperatures: Codable, Hashable {
    var min: Double     // min temp
    var max: Double     // max temp
    var day: Double     // day temp idk what this means
    var eve: Double     // evening temp
    var night: Double   // night temp
    var morn: Double    // morning temp
}

struct CurrentWeatheryItems: Codable, Hashable {
    var temp: Double		// current temperature
    var feels_like: Double	// what the current temperature feels like (because of factors like wind)
    var wind_speed: Double		// speed of the wind
}

extension Temperatures: Identifiable {
    var id: UUID { return UUID() }
}

extension Daily: Identifiable {
    var id: UUID { return UUID() }
}

