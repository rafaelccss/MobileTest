import SwiftUI

struct OfferComponent: View {
    let offer: Offer
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(offer.embedded.request.title)
                .font(.title)
            
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
                .padding(.bottom, 8)
            
            HStack {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color("listColor"))
                    Text(offer.embedded.request.embedded.user.name)
                }
                Spacer()
                HStack {
                    Image(systemName: "person.badge.clock.fill")
                        .foregroundColor(Color("listColor"))
                    Text(time())
                }
            }
            .padding(.bottom, 8)
            
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(Color("listColor"))
                Text(offer.embedded.request.embedded.address.neighborhood + " - " + offer.embedded.request.embedded.address.city)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
    
    func time() -> String {
        let unconvertedTime = offer.embedded.request.createdAt
        let delimiter = "T"
        let time = unconvertedTime.components(separatedBy: delimiter)
        return time.first!
    }
}

struct OfferComponent_Previews: PreviewProvider {
    
    static let offer = Offer(
        state: "read",
        embedded: OfferEmbedded(
            request: Request(
                createdAt: "2016-03-04T14:47:05.000+00:00",
                title: "Buffet Completo",
                embedded: RequestEmbedded(
                    user: User(name: "Eduardo L'Hotellier"),
                    address: Address(
                        city: "São Paulo",
                        neighborhood: "Vila Leopoldina",
                        uf: "SP")
                )
            )
        ),
        links: Links(
            linksSelf: SelfClass(
                href: "https://testemobile.getninjas.com.br/offer-1"
            )
        )
    )
    
    static var previews: some View {
        OfferComponent(offer: offer)
            .padding(16)
            .previewLayout(.sizeThatFits)
    }
}
