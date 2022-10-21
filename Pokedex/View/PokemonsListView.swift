import SwiftUI

struct PokemonsListView: View {
    
    @EnvironmentObject private var viewModel: PokedexViewModel
    
    var values = [10, 20, 50, 100, 300, 600, 800, 1154]
    @State var selectedValue = 10
    @State var offset: Int = 0
    
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach(viewModel.pokemons, id: \.name) { pokemon in
                    NavigationLink(destination: PokemonDetailsView(url: pokemon.url ?? "")
                                   //Importante usar para pegar o objeto, e quando clicar na linha aparecer as infos da api
                        .environmentObject(PokemonDetailViewModel())) {
                            PokemonCell(pokemon: pokemon)
                        }
                    Divider()
                }
            }
            
            HStack {
                Picker("Quantidade de pokemons", selection: $selectedValue) {
                    ForEach(values, id: \.self) {
                        Text(String($0))
                    }
                }
                //Atualizar quando muda o valor da variavel selectedValue
                .onChange(of: selectedValue) { newValue in
                    viewModel.fetchPokemon(limit: selectedValue)
                }
            }
        }
        
    }
    func totalPages() -> Int {
        return (1154/selectedValue) + 1
    }
}

struct PokemonsListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonsListView()
            .environmentObject(PokedexViewModel())
    }
}
