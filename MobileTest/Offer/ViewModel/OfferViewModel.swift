import Foundation

final class OfferViewModel: ObservableObject {
    
    let bundlePath = Bundle.main.path(forResource: "OffersResponse", ofType: "json")
    lazy var jsonData = try? String(contentsOfFile: bundlePath!).data(using: .utf8)
    lazy var offerModel = try? JSONDecoder().decode(OfferModel.self, from: jsonData!)
    
    init() {
        print(offerModel)
    }
}
