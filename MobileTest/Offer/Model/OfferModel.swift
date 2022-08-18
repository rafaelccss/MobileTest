import Foundation

struct OfferModel: Codable {
    let offers: [Offer]
    let links: Links

    enum CodingKeys: String, CodingKey {
        case offers
        case links = "_links"
    }
}

// MARK: - Offer
struct Offer: Codable {
    let state: String
    let embedded: OfferEmbedded
    let links: Links

    enum CodingKeys: String, CodingKey {
        case state
        case embedded = "_embedded"
        case links = "_links"
    }
}

struct OfferEmbedded: Codable {
    let request: Request
}

struct Request: Codable {
    let createdAt: String
    let title: String
    let embedded: RequestEmbedded

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title
        case embedded = "_embedded"
    }
}

struct RequestEmbedded: Codable {
    let user: User
    let address: Address
}

struct Address: Codable {
    let city: String
    let neighborhood: String
    let uf: String
}
 
struct User: Codable {
    let name: String
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

struct SelfClass: Codable {
    let href: String
}
