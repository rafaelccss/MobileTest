import SwiftUI

struct OfferView: View {
    @ObservedObject var viewModel = OfferViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if let offers = viewModel.offerModel?.offers {
                    ForEach(offers) { offer in
                        NavigationLink(
                            destination: OfferDetail(
                                viewModel: OfferDetailViewModel(url: offer.links.linksSelf.href)
                            )
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
