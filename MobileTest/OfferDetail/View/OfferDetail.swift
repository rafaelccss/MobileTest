import SwiftUI

struct OfferDetail: View {
    @ObservedObject var viewModel: OfferDetailViewModel
    
    var body: some View {
        if let offerDetail = viewModel.offerDetail {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Group {
                            Text(offerDetail.title)
                                .font(.title)
                            
                            line
                            
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(Color("listColor"))
                                Text(offerDetail.embedded.address.neighborhood + " - " + offerDetail.embedded.address.city)
                                // inserir distância
                            }
                            
                            line
                            
                            ForEach(offerDetail.embedded.info) { info in
                                HStack(alignment: .top) {
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(Color("listColor"))
                                    VStack(alignment: .leading) {
                                        Text(info.label)
                                            .bold()
                                        
                                        switch info.value {
                                        case .string(let value):
                                            Text(value)
                                        case .stringArray(let array):
                                            ForEach(array, id: \.self) { element in
                                                VStack {
                                                    Text(element)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.vertical)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        
                        CustomerContact(
                            contactState: .hidden,
                            phones: offerDetail.embedded.user.embedded.phones,
                            email: offerDetail.embedded.user.email
                        )
                        
                        Text("Aceite o pedido para destravar o contato!")
                            .font(.subheadline)
                            .bold()
                            .padding(32)
                        
                        Spacer()
                    }
                    .background(Color.white)
                    .padding(8)
                }
                .background(
                    Color("listColor")
                        .edgesIgnoringSafeArea([.top, .horizontal])
                )
                VStack {
                    Spacer()
                    
                    OfferChoice()
                }
            }
        }
    }
    
    var line: some View {
        Line()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(height: 1)
            .padding(.bottom, 8)
    }
}

struct OfferDetail_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetail(
            viewModel: OfferDetailViewModel(
                url: "https://testemobile.getninjas.com.br/offer-1"
            )
        )
    }
}
