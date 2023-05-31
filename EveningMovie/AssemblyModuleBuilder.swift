//
//  AssemblyModuleBuilder.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 31.05.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMoviesModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(
        router: RouterProtocol,
        id: String
    ) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    func createMoviesModule(router: RouterProtocol) -> UIViewController {
        let view = MoviesViewController()
        let networkManager = NetworkManager()
        let presenter = MoviesPresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(
        router: RouterProtocol,
        id: String
    ) -> UIViewController {
        let view = MovieDetailsViewController()
        let networkManager = NetworkManager()
        let presenter = DetailPresenter(
            view: view,
            router: router,
            networkManager: networkManager,
            id: id
        )
        view.presenter = presenter
        return view
    }
}
