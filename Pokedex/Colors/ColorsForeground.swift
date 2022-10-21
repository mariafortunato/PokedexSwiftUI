import SwiftUI

class ColorsForeground {
    
    func verifyTypePokemon(_ typeName: String) -> Color {
        
        switch typeName {
        case "grass", "bug":
            return Color(Colors.green.rawValue)
        case "water", "ice":
            return Color(Colors.blue.rawValue)
        case "electric", "ground", "rock":
            return Color(Colors.yellow.rawValue)
        case "fire":
            return Color(Colors.red.rawValue)
        case "fighting", "dark":
            return Color(Colors.brown.rawValue)
        case "dragon", "ghost", "poison":
            return Color(Colors.purple.rawValue)
        case "flying":
            return Color(Colors.purple.rawValue)
        case "psychic", "fairy":
            return Color(Colors.pink.rawValue)
        case "normal", "steel":
            return Color(Colors.gray.rawValue)
        default:
            return Color.black
        }
    }
}
