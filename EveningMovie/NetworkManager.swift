//
//  NetworkManager.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 17.04.2023.
//

import Foundation

enum ObtainPostResult {
    case success(posts: [Post])
    case failure(error: Error)
}

class NetworkManager {
    
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    let headers = [
        "X-RapidAPI-Key": "86dc3f71bdmshc0432b056e31bfep14ffbfjsnd8eba6fe5afd"
    ]
    
    func obtainPost(completion: @escaping (ObtainPostResult) -> Void ) {
        guard let url = URL(string: "https://imdb-top-100-movies.p.rapidapi.com/") else {
            return
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        let task = session.dataTask(with: request) { [weak self](data, response, error) in
            var result: ObtainPostResult
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let strongSelf = self else {
                result = .failure(error: error!)
                return
            }
            
            if error == nil, let parsData = data {
                guard let posts = try?
                        strongSelf.decoder.decode([Post].self, from: parsData) else {
                    result = .failure(error: error!)
                    return
                }
                result = .success(posts: posts)
            } else {
                result = .failure(error: error!)
            }
            
        }
        task.resume()
    }
}

