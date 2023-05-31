//
//  MoviesPresenter.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 07.05.2023.
//

final class MoviesPresenter {
    private let networkManager = NetworkManager()
    private let view: MoviesView?
    private var movies = [Movie]()
    
    init(view: MoviesView) {
        self.view = view
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
                self.view?.updateView()
            case .failure(let error) :
                print("Error: \(error.localizedDescription)")
                
            }
        }
    }
}
