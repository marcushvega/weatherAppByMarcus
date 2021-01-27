//__FILENAME__  was created on __DATE__

import SwiftUI

struct CityList: View {
    var body: some View {
        NavigationView {
        VStack {
            List(cityRows) { city in
                CityRow(city: city)
                NavigationLink(
                    destination: SingleCityView(),
                    label: {
                        Text("")
                    }
                )
            }
        }
        .navigationTitle("Cities")
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        CityList()
    }
}
