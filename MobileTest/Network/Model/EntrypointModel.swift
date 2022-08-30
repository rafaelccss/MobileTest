import Foundation

struct EntrypointModel: Codable {
    let links: EntrypointLinks

    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }
}

struct EntrypointLinks: Codable {
    let leads, offers: List
}

struct List: Codable {
    let href: String
}
