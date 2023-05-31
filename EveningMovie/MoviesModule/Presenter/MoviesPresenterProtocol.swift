//
//  MoviesPresenterProtocol.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 12.05.2023.
//

import Foundation

protocol MoviesPresenterProtocol: AnyObject {
    func getMoviesState() -> [Movie]
    func getMovies()
}
    

