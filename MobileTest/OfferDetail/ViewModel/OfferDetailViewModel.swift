import Foundation
import Combine

final class OfferDetailViewModel: ObservableObject {
    
    @Published var offerDetail: OfferDetailModel?
    
    private var network: NetworkProtocol
    
    private var bag = Set<AnyCancellable>()
    
    init(url: String) {
        network = Network()
        network.url = url
        
        fetchOfferDetail()
    }
    
    func fetchOfferDetail() {
        let request: AnyPublisher<OfferDetailModel, Error> = network.fetch()
        
        request
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { error in
                    print(error)
                },
                receiveValue: { [weak self] offerDetail in
                    self?.offerDetail = offerDetail
                }
            )
            .store(in: &bag)
    }
}
