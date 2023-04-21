//
//  NetworkManager.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 17.04.2023.
//

import Foundation

enum NetworkError: Error {
    case custom(String)
    
    var localizedDescription: String {
        switch self {
        case .custom(let message):
            return (message)
        }
    }
}
class NetworkManager {
    
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    let headers = [
        "X-RapidAPI-Key": "86dc3f71bdmshc0432b056e31bfep14ffbfjsnd8eba6fe5afd"
    ]
    
    func obtainPost(completion: @escaping (Result<[Post], NetworkError>) -> ()) {
        guard let url = URL(string: "https://imdb-top-100-movies.p.rapidapi.com/") else {
            return
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.custom(error.localizedDescription)))
                }
                
                guard let data = data else { return }
                do {
                    //let decoder = JSONDecoder()
                    //decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedMovies = try self.decoder.decode([Post].self, from: data)
                    completion(.success(decodedMovies))
                    
                } catch {
                    completion(.failure(.custom(error.localizedDescription)))
                }
            }
            
        }
        task.resume()
    }
}

