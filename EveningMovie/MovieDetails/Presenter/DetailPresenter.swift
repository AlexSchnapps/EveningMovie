//
//  DetailPresenter.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 10.05.2023.
//

import Foundation

final class DetailPresenter {
    
    private let networkManager = NetworkManager()
    private weak var view: MovieDetailsView?
    
    init(view: MovieDetailsView) {
        self.view = view
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func getMovieDescription(movieID: String) {
        networkManager.request(
            endPoint: .movieDescription(movieID)
        ) { [weak self] (result: Result<Movie, NetworkError>) in
            switch result {
            case .success(let post) :
                print(post)
                DispatchQueue.main.async {
                    self?.view?.updateView(item: post)
                }
            case .failure(let error) :
                print("Error: \(error.localizedDescription)")
                
            }
        }
    }
}
