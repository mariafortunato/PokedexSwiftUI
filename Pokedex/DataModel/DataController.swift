import CoreData
import SwiftUI

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "PokemonCoreData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("Erro ao salvar")
        }
    }
    
    func favorite(name: String, url: String, isFavorite: Bool = false, context: NSManagedObjectContext) {
        
      let pokemon = PokemonCoreData(context: context)


        pokemon.name = name
        pokemon.url = url
        pokemon.isFavorite = isFavorite
        
        save(context: context)
        
    }
    
    func deleteFavoritePokemon(pokemon: FetchedResults<PokemonCoreData>.Element, context: NSManagedObjectContext) {
        
        context.delete(pokemon)
        save(context: context)
    }
}
