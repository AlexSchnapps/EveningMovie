//
//  MovieDetailsView.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 10.05.2023.
//

protocol MovieDetailsView: AnyObject {
    func updateView(item: Movie)
}
