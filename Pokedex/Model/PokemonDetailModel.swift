import Foundation

struct PokemonDetailModel: Codable {
    var abilities: [Abilities]
    var name: String?
    var id: Int?
    var sprites: SpritesModel
    var base_experience: Int?
    var height: Int?
    var weight: Int?
    var types: [Types]
    var stats: [Stats]
}

struct Types: Codable {
    var type: Type
}

struct Type: Codable {
    var name: String?
}


