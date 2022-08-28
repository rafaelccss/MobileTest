import Foundation

final class OfferDetailViewModel: ObservableObject {
    
    let bundlePath = Bundle.main.path(forResource: "OfferDetail", ofType: "json")
    lazy var jsonData = try? String(contentsOfFile: bundlePath!).data(using: .utf8)
    lazy var offerModel = try? JSONDecoder().decode(OfferDetailModel.self, from: jsonData!)
    
    init() {
        print(offerModel as Any)
    }
}
