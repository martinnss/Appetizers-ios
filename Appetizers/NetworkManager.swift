//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Martin Olivares on 29-06-25.
//

import Foundation
import UIKit



final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    // getAppetizers es basicamente in apicall con error handling
    ///                                           retorna correcto o error con APerror
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        //error url
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            //error al momento de buscar la data
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            // error por que no tiene status code 200
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            //error de data invalida
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            //si todo sale bien, entonces docode the data
            do {
                let decoder = JSONDecoder()
                
                // decode usando el appetizerResponse que se creo en appetizer que es como viene la data de la api, nombres y datatypes
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                // si falla aca hay que ver el modelo de decode de data, en este caso es AppetizerResponse
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
//    func getAppetizers() async throws -> [Appetizer] {
//        guard let url = URL(string: appetizerURL) else {
//            throw APError.invalidURL
//        }
//        
//        let (data, _) = try await URLSession.shared.data(from: url)
//        
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(AppetizerResponse.self, from: data).request
//        } catch {
//            throw APError.invalidData
//        }
//    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
