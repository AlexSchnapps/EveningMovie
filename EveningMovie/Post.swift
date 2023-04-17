//
//  Post.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 17.04.2023.
//

import Foundation

let url = Hosts.host + Hosts.apiKey + Hosts.language

enum Hosts {
    static let host = "https://api.themoviedb.org/3/movie/popular"
    static let apiKey = "?api_key=d3928c2d6b3f29395d220c68e1eedd28&"
    static let language = "language=ru-RU"
    static let posterHost = "https://image.tmdb.org/t/p/w500"
    static let detailsHost = "https://api.themoviedb.org/3/movie/"
}


