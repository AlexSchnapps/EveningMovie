//
//  DetailPresenter.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 10.05.2023.
//

import Foundation

final class DetailPresenter {
    //MARK: - Dependencies
    private weak var view: MovieDetailsView?
    private let networkManager: NetworkManagerProtocol
    private let router: RouterProtocol
   
    //MARK: - Private Properties
    private let id: String
   
    //MARK: - Init
    init(
        view: MovieDetailsView,
        router: RouterProtocol,
        networkManager: NetworkManagerProtocol,
        id: String
    ) {
        self.view = view
        self.router = router
        self.networkManager = networkManager
        self.id = id
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func getMovieDescription() {
        networkManager.request(
            endPoint: .movieDescription(id)
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
