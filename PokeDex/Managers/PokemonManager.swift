//
//  PokemonManager.swift
//  PokeDex
//
//  Created by João Dubiela on 26/11/22.
//

import Foundation

class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion:@escaping(DetailPokemon) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/1/\(id)/" , model: DetailPokemon.self) {
            data in completion(data)
        } failure: { error in
            print(error)
        }
    }
}
