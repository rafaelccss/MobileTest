import SwiftUI

struct OfferView: View {
    @ObservedObject var viewModel = OfferViewModel()
    
    var body: some View {
        Text("Hello, Offer!")
    }
}

struct Offer_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}
