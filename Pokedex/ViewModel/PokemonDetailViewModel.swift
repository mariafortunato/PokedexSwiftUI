
import Foundation

class PokemonDetailViewModel: ObservableObject {
    
    @Published var pokemonDetail: PokemonDetailModel?
    
    var url: String?
    
    init() {
        fetchDetailPokemon(url: url ?? "")
    }
    
    func fetchDetailPokemon(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error as Any)
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(PokemonDetailModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.pokemonDetail = result
                    }
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
