import SwiftUI

struct PokemonCell: View {

    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest (sortDescriptors: []) var pokemonCoreData: FetchedResults<PokemonCoreData>

    let pokemon: PokemonModel?
    @State var star = "star"
    
    var body: some View {

            HStack {
                TextTitle(
                    text: pokemon?.name?.capitalized ?? "",
                    alignment: .leading,
                    foreground: Color(Colors.green.rawValue),
                    size: FontSize.titleCell.rawValue
                )
                
                Button {
                    favoritar(name: pokemon?.name ?? "", url: pokemon?.url ?? "", isFavorite: setStar())

                } label: {
                    Label("", systemImage: star)
                }
                .accentColor(Color(Colors.yellow.rawValue))
                
            }
            .padding()
            .onAppear() {
                setStar()
            }
    }

    func setStar() -> Bool {
        let favorite: Bool
        
        if pokemonCoreData.contains(where: { $0.name == pokemon?.name }) {
            star = "star.fill"
           favorite = true
        } else {
            star = "star"
            favorite = false
        }
        return favorite
    }
    
    func favoritar(name: String, url: String, isFavorite: Bool) {
        if pokemonCoreData.contains(where: { $0.name == pokemon?.name }) == false {
            DataController().favorite(name: name, url: url, isFavorite: isFavorite, context: managedObjectContext)
        } else {
            print("Pokemon já favoritado")
        }
    }
}

//struct PokemonCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCell().environmentObject(PokemonDetailViewModel())
//    }
//}
