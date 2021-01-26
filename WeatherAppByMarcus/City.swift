//__FILENAME__  was created on __DATE__

import Foundation

struct City: Codable, Hashable, Identifiable {
    var name: String
    var imageName: String
    var lon: Double
    var lat: Double
    var id: Int
}
