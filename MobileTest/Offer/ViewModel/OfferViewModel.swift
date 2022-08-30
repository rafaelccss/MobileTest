import Foundation
import Combine

final class OfferViewModel: ObservableObject {
    
    @Published var offerModel: OfferModel?
    private var links: EntrypointLinks?
    
    private var network: NetworkProtocol
    
    private var bag = Set<AnyCancellable>()
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
        
        fetchLink()
    }

    private func fetchLink() {
        let request: AnyPublisher<EntrypointModel, Error> = network.fetch()
        
        request
            .sink(
                receiveCompletion: { error in
                    print("fetchLink error: \(error)")
                },
                receiveValue: { [weak self] entrypointLinks in
                    self?.links = entrypointLinks.links
                    self?.fetchOffers()
                }
            )
            .store(in: &bag)
    }
    
    private func fetchOffers() {
        guard let links = links else { return }
        
        network.url = links.offers.href
        let request: AnyPublisher<OfferModel, Error> = network.fetch()
        
        request
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { error in
                    print(error)
                },
                receiveValue: { [weak self] offerModel in
                    self?.offerModel = offerModel
                }
            )
            .store(in: &bag)
    }
}
