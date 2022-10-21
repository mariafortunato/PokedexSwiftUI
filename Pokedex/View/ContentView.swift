import SwiftUI

struct ContentView: View {

    var body: some View {
        
        NavigationView {
            TabView {
                PokemonsListView()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                FavoritesPokemonView()
                    .tabItem {
                        Label("Favorite", systemImage: "star")
                    }
            }
        }        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
