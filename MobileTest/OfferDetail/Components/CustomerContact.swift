import SwiftUI

enum ContactState {
    case hidden, shown
}

struct CustomerContact: View {
        
    let contactState: ContactState
    let phones: [Phone]
    let email: String
    
    private var backgroundColor: Color {
        switch contactState {
        case .hidden:
            return Color("clientContactHidden")
        case .shown:
            return Color("clientContactShown")
        }
    }
    
    private var foregroundColor: Color {
        switch contactState {
        case .hidden:
            return Color.white
        case .shown:
            return Color.black
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Contato do cliente")
                    .bold()
                    .font(.title3)
                
                ForEach(phones) { phone in
                    HStack {
                        switch contactState {
                        case .hidden:
                            Image(systemName: "lock.fill")
                        case .shown:
                            Image(systemName: "phone.fill")
                        }
                        Text(phone.number)
                    }
                }
                
                HStack {
                    switch contactState {
                    case .hidden:
                        Image(systemName: "lock.fill")
                    case .shown:
                        Image(systemName: "envelope.fill")
                    }
                    Text(email)
                }
            }
            .foregroundColor(foregroundColor)

            Spacer()
        }
        .padding(16)
        .background(backgroundColor)
    }
}

struct CustomerContact_Previews: PreviewProvider {
    static let phones = [Phone(number: "(11) 3***-****")]
    static let email = "e*******@hotmail.com"
    
    static var previews: some View {
        CustomerContact(contactState: .shown, phones: phones, email: email)
            .previewLayout(.sizeThatFits)
        CustomerContact(contactState: .hidden, phones: phones, email: email)
            .previewLayout(.sizeThatFits)
    }
}
