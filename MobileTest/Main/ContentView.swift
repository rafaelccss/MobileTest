import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Offer()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            Lead()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
