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
            return message
        }
    }
}

enum Hosts {
    case top100
    case movieDescription(String)
    case host
    
    var value: String {
        switch self {
        case .top100:
            return ""
        case .movieDescription(let id):
            return id
        case .host:
            return "https://imdb-top-100-movies.p.rapidapi.com/"
            
        }
    }
}

class NetworkManager {
    
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    let headers = [
        "X-RapidAPI-Key":
            "86dc3f71bdmshc0432b056e31bfep14ffbfjsnd8eba6fe5afd"
    ]
    
    func request<T: Codable>(
        endPoint: Hosts,
        completion: @escaping (Result<T, NetworkError>) -> ()
    ) {
        guard let url = URL(string: Hosts.host.value + endPoint.value) else {
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
                    self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try self.decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                    
                } catch {
                    completion(.failure(.custom(error.localizedDescription)))
                }
            }
        }
        task.resume()
    }
}
