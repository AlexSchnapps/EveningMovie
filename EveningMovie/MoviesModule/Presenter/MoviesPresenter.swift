//
//  MoviesPresenter.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 07.05.2023.
//

import Foundation

protocol MoviesPresenterProtocol: AnyObject {
    func getMoviesState() -> [Movie]
    func getMovies()
}

protocol MoviesViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

class MoviesPresenter {
    private let networkManager: NetworkManagerProtocol
    private let view: MoviesViewProtocol
    private var movies = [Movie]()
    private let router: RouterProtocol
    
    init(
        view: MoviesViewProtocol,
        networkManager: NetworkManagerProtocol,
        router: RouterProtocol
    ) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
    }
    
}

extension MoviesPresenter: MoviesPresenterProtocol {
    func getMoviesState() -> [Movie] {
        movies
    }
    
    func getMovies() {
        networkManager.request(endPoint: .top100) { [weak self] (result: Result<[Movie], NetworkError>) in
            guard let self = self else { return }
            switch result {
            case .success(let posts) :
                self.movies = posts
                print(posts)
                self.view.success()
            case .failure(let error) :
                print("Error: \(error.localizedDescription)")
                
            }
        }
    }
}
