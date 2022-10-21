
import Foundation

struct SpritesModel: Codable {
    var front_default: String?
    var back_default: String?
    var other: Other
}

struct Other: Codable {
    var dream_world: DreamWorld
    var home: Home
}

struct DreamWorld: Codable {
    var front_default: String?
}

struct Home: Codable {
    var front_default: String?
    var front_shiny: String?
}
