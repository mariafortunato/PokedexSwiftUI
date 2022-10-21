
import Foundation

struct PokemonData: Codable {
    var results: [PokemonModel] = []
}

struct PokemonModel: Codable {
    var name: String?
    var url: String?
}
