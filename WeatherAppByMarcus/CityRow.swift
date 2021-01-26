//__FILENAME__  was created on __DATE__

import SwiftUI

struct CityRow: View {
    var city: City
    var body: some View {
        HStack {
            Text(verbatim: city.name)
            Spacer()
        }
    }
}


struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        CityRow(city: cityRows[0])
    }
}
