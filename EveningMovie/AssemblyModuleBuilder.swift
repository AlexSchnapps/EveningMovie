//
//  AssemblyModuleBuilder.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 31.05.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMoviesModule(router: RouterProtocol) -> UIViewController
    func createDetailMdule(movie: Movie, router: RouterProtocol) -> UIViewController
}

