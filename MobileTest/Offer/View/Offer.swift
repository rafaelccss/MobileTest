import SwiftUI

struct OfferView: View {
    @ObservedObject var viewModel = OfferViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.offerModel!.offers) { offer in
                        NavigationLink(
                            destination: OfferDetail()
                        ) {
                            OfferComponent(offer: offer)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 24)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .background(
                Color("listColor")
                    .edgesIgnoringSafeArea([.top, .horizontal])
            )
            .navigationTitle("Oferta")
        }
    }
}

struct Offer_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}
