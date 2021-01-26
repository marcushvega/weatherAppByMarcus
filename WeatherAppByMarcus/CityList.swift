//__FILENAME__  was created on __DATE__

import SwiftUI

struct CityList: View {
    var body: some View {
        List(cityRows) { city in
            CityRow(city: city)
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        CityList()
    }
}
