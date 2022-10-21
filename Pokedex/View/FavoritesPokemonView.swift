import SwiftUI

struct FavoritesPokemonView: View {

    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest (sortDescriptors: []) var pokemon: FetchedResults<PokemonCoreData>
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(pokemon.count)")
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
            .onAppear() {
                print(pokemon)
            }
            .navigationTitle("Favorites")
            .accentColor(Color(Colors.green.rawValue))
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
