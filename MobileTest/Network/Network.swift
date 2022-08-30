import Foundation
import Combine

protocol NetworkProtocol {
    var url: String { get set }
    
    func fetch<T: Decodable>() -> AnyPublisher<T, Error>
}

class Network: NetworkProtocol {
    var url: String = "https://testemobile.getninjas.com.br"
    
    private let urlSession = URLSession.shared
    
    func fetch<T: Decodable>() -> AnyPublisher<T, Error> {
        let url = URL(string: url)!
        
        return urlSession.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
