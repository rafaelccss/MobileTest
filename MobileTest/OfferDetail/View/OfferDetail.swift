import SwiftUI

struct OfferDetail: View {
    @ObservedObject var viewModel = OfferDetailViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        Text(viewModel.offerModel!.title)
                            .font(.title)
                        
                        line
                        
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(Color("listColor"))
                            Text(viewModel.offerModel!.embedded.address.neighborhood + " - " + viewModel.offerModel!.embedded.address.city)
                            // inserir distância
                        }
                        
                        line
                        
                        ForEach(viewModel.offerModel!.embedded.info) { info in
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
                        phones: viewModel.offerModel!.embedded.user.embedded.phones,
                        email: viewModel.offerModel!.embedded.user.email
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
    
    var line: some View {
        Line()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(height: 1)
            .padding(.bottom, 8)
    }
}

struct OfferDetail_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetail()
    }
}
