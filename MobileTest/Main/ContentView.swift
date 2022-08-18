import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            OfferView()
                .tabItem {
                    Label("Disponíveis", systemImage: "bag")
                }
            
            Lead()
                .tabItem {
                    Label("Aceitos", systemImage: "checkmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
