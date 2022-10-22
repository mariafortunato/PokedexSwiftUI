import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            PokemonsListView()
                .tabItem {
                    Label("Pokémons", image: "pokebola (3)")
                }
            FavoritesPokemonView()
                .tabItem {
                    Label("Favorites", image: "estrela")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
