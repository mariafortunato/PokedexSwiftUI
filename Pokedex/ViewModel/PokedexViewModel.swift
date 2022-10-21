import Foundation

class PokedexViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonModel] = []
    
    init() {
        fetchPokemon(limit: 10)
    }
    
    func fetchPokemon(limit: Int) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=0") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Status code:\(String(describing: error))")
            }
            
            do {
                if let data = data {
                    let pokemon = try JSONDecoder().decode(PokemonData.self, from: data)
                    DispatchQueue.main.async {
                        self.pokemons = pokemon.results
                    }
                    
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
