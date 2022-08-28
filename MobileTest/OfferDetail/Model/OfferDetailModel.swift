import Foundation

struct OfferDetailModel: Codable {
    let distance: Int
    let leadPrice: Int
    let title: String
    let embedded: OfferDetailModelEmbedded
    let links: OfferDetailLinks

    enum CodingKeys: String, CodingKey {
        case distance
        case leadPrice = "lead_price"
        case title
        case embedded = "_embedded"
        case links = "_links"
    }
}

// MARK: - OfferDetailModelEmbedded
struct OfferDetailModelEmbedded: Codable {
    let info: [Info]
    let user: UserDetails
    let address: AddressDetails
}

struct Info: Codable, Identifiable {
    var id = UUID()
    
    let label: String
    let value: Value
    
    enum CodingKeys: String, CodingKey {
        case label
        case value
    }
}

enum Value: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

struct UserDetails: Codable {
    let name: String
    let email: String
    let embedded: UserEmbedded

    enum CodingKeys: String, CodingKey {
        case name
        case email
        case embedded = "_embedded"
    }
}

struct UserEmbedded: Codable{
    let phones: [Phone]
}

struct Phone: Codable, Identifiable {
    var id = UUID()
    
    let number: String
    
    enum CodingKeys: String, CodingKey {
        case number
    }
}

struct AddressDetails: Codable {
    let city: String
    let neighborhood: String
    let uf: String
    let geolocation: Geolocation
}

struct Geolocation: Codable {
    let latitude, longitude: Double
}

// MARK: - OfferDetailLinks
struct OfferDetailLinks: Codable {
    let accept, reject: Accept
}

struct Accept: Codable {
    let href: String
}
