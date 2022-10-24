import SwiftUI

struct FavoritesPokemonView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest (sortDescriptors: []) var pokemon: FetchedResults<PokemonCoreData>
    
    var body: some View {
        NavigationView {
            VStack {
                TextTitle(
                    text: "Favorites \(pokemon.count)",
                    alignment: .center,
                    foreground: Color(Colors.green.rawValue),
                    size: FontSize.titleDetails.rawValue
                )
                ScrollView {
                    
                    ForEach(pokemon, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailsView(url: pokemon.url ??  "")
                            .environmentObject(PokemonDetailViewModel())) {
                                PokemonFavoriteCell(pokemon: pokemon)
                            }
                        Divider()
                    }
                }
            }
            .accentColor(Color(Colors.green.rawValue))
            .navigationTitle("")
        }
    }
}

struct FavoritesPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesPokemonView()
            .environmentObject(PokedexViewModel())
            .environmentObject(PokemonDetailViewModel())
    }
}
