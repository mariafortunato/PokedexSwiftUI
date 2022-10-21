//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Maria Alice Rodrigues Fortunato on 26/09/22.
//

import SwiftUI

@main
struct PokedexApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment((\.managedObjectContext), dataController.container.viewContext)
                .environmentObject(PokedexViewModel())
                .environmentObject(PokemonDetailViewModel())
                
        }
    }
}
