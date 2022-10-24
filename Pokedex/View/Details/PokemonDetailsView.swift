
import SwiftUI


struct PokemonDetailsView: View {
    
    @EnvironmentObject private var viewModel: PokemonDetailViewModel
    var colors = ColorsForeground()
    // Receber url da contentView
    var url: String = ""
    @State var index: Int = 0
    
    var body: some View {
        let colorPokemon = colors.verifyTypePokemon(viewModel.pokemonDetail?.types[0].type.name ?? "")
        ScrollView {
            ZStack {
                VStack{
                    VStack {
                        TextTitle(
                            text: viewModel.pokemonDetail?.name?.capitalized ?? "",
                            alignment: .center,
                            foreground: colorPokemon,
                            size: FontSize.titleDetails.rawValue
                        )
                        TextTitle(
                            text: "Nº \(viewModel.pokemonDetail?.id ?? 0)",
                            alignment: .center,
                            foreground: Color.gray,
                            size: FontSize.subtitlesDetails.rawValue
                        )
                    }
                    .padding()
                    VStack {
                        TabView(selection: $index) {
                            ForEach(0..<1 ) { index in
                                AsyncImage(
                                    url: URL(
                                        string: viewModel.pokemonDetail?.sprites.other.home.front_default ?? "https://cdn-icons-png.flaticon.com/512/1695/1695213.png")
                                )
                                .scaleEffect(0.5)
                                AsyncImage(
                                    url: URL(
                                        string: viewModel.pokemonDetail?.sprites.other.home.front_shiny ?? "https://cdn-icons-png.flaticon.com/512/1695/1695213.png")
                                )
                                .scaleEffect(0.5)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .frame(height: 250)
                    }
                    
                    VStack {
                        SubtitleDetail(
                            text: "Informations",
                            foreground: colorPokemon,
                            size: FontSize.subtitlesDetails.rawValue
                        )
                        InformationsDetail(
                            text: "Height",
                            textResult: "\(viewModel.pokemonDetail?.height ?? 0)",
                            foreground: colorPokemon
                        )
                        InformationsDetail(
                            text: "Weight",
                            textResult: "\(viewModel.pokemonDetail?.weight ?? 0) kg",
                            foreground: colorPokemon
                        )
                        InformationsDetail(
                            text: "Experience",
                            textResult: "\(viewModel.pokemonDetail?.base_experience ?? 0)",
                            foreground: colorPokemon
                        )
                        
                        VStack {
                            SubtitleDetail(text: "Type", foreground: colorPokemon, size: FontSize.subtitlesDetails.rawValue)
                            ForEach(0..<(viewModel.pokemonDetail?.types.count ?? 0), id: \.self) { count in
                                HStack {
                                    InformationsDetail(
                                        text: "\(viewModel.pokemonDetail?.types[count].type.name?.capitalized ?? "")",
                                        foreground: colorPokemon
                                    )
                                }
                            }
                        }
                        VStack {
                            SubtitleDetail(text: "Abilities", foreground: colorPokemon, size: FontSize.subtitlesDetails.rawValue)
                            
                            ForEach(0..<(viewModel.pokemonDetail?.abilities.count ?? 0), id: \.self) { count in
                                
                                InformationsDetail(
                                    text: "\(viewModel.pokemonDetail?.abilities[count].ability.name?.capitalized ?? "")",
                                    foreground: colorPokemon
                                )
                            }
                        }
                        
                        VStack {
                            SubtitleDetail(
                                text: "Stats",
                                foreground: colorPokemon,
                                size: FontSize.subtitlesDetails.rawValue
                            )
                            ForEach(0..<(viewModel.pokemonDetail?.stats.count ?? 0), id:\.self) { stat in
                                InformationsStatsDetail(
                                        text: viewModel.pokemonDetail?.stats[stat].stat.name?.capitalized,
                                        foreground: colorPokemon,
                                        value: viewModel.pokemonDetail?.stats[stat].base_stat,
                                        valuePokemon: viewModel.pokemonDetail?.stats[stat].base_stat?.description
                                    )
                            }
                        }
                        .padding(.top)
                    }
                    .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1))
                .padding()
            }
            .offset(y: -40)
            
        }
        .onAppear {
            // quando a tela aparecer, buscar os dados da API
            viewModel.fetchDetailPokemon(url: url)
        }
    }
}

struct PokemonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView()
            .environmentObject(PokemonDetailViewModel())
    }
}
