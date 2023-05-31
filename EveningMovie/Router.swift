//
//  Router.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 31.05.2023.
//

import UIKit

protocol RouterMovie {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMovie {
    func initialViewController()
    func showDetail(id: String)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController { guard let movieViewController = assemblyBuilder?.createMoviesModule(router: self) else { return }
            navigationController.viewControllers = [movieViewController]
        }
    }
    
    func showDetail(id: String) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(
                router: self,
                id: id
            ) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    
    
}
