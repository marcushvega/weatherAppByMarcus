//__FILENAME__  was created on __DATE__

import SwiftUI

struct CityTemperatureRow: View {
    var city: City
    var body: some View {
        HStack {
            // might put static images of city skylines here
            Text(verbatim: city.name)
            Spacer()
        }
    }
}

struct CityTemperatureRow_Previews: PreviewProvider {
    static var previews: some View {
        CityTemperatureRow()
    }
}
