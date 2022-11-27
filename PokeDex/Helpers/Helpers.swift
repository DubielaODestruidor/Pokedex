//
//  Helpers.swift
//  PokeDex
//
//  Created by João Dubiela on 26/11/22.
//

import Foundation

extension Bundle {
    
    func decode<T:Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("\(file) não encontrado no pacote.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Não foi possível carregar \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Não foi possível decifrar \(file)")
        }
        
        return loadedData
    }
    
    func fetchData<T:Decodable>(url: String, model: T.Type, completion:  @escaping(T) -> (), failure:@escaping(Error) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data
            else {
                if let error = error {
                    failure(error)
                }
                return
            }
             
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            }
            catch {
                failure(error)
            }
        }
        .resume()
    }
}
