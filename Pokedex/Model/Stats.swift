import Foundation

struct Stats: Codable {
    var base_stat: Int?
    var stat: Stat
}

struct Stat: Codable {
    var name: String?
}
