import SwiftUI

struct OfferChoice: View {
    
    let accept: () -> Void = {}
    let reject: () -> Void = {}
    
    var body: some View {
        HStack(spacing: 0) {
            
            Button {
                reject()
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "xmark")
                    Text("RECUSAR")
                    Spacer()
                }
                .padding()
                .foregroundColor(.gray)
                .background(Color(UIColor.systemGray6))
            }
            
            
            Button {
                accept()
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "checkmark")
                    Text("ACEITAR")
                    Spacer()
                }
                .padding()
                .foregroundColor(.black)
                .background(Color.green)
            }
        }
        .background(Color.white)
        .frame(maxHeight: 48)
    }
}

struct OfferChoice_Previews: PreviewProvider {
    static var previews: some View {
        OfferChoice()
    }
}
