import SwiftUI

struct PokemonFavoriteCell: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    let pokemon: FetchedResults<PokemonCoreData>.Element

    @State var star = "star.fill"
    
    var body: some View {
        HStack {
            TextTitle(
                text: pokemon.name ?? "",
                alignment: .leading,
                foreground: Color(Colors.green.rawValue),
                size: FontSize.titleCell.rawValue
            )
            Button {
                noFavorite()
                
            } label: {
                Label("", systemImage: star)
            }
            .accentColor(Color(Colors.yellow.rawValue))
        }
        .padding()
    }
    func noFavorite() {
        DataController().deleteFavoritePokemon(pokemon: pokemon, context: managedObjectContext)
    }
    
    
}

//struct PokemonDetailCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailCell()
//    }
//}
