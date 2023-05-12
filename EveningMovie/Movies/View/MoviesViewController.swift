//
//  ViewController.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 06.04.2023.
//

import UIKit
import SnapKit

class MoviesViewController: UIViewController {
    
    private var presenter: MoviesPresenterProtocol!
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: layout
        )
        collectionView.register(cellType: MoviePreviewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.titleMovies
        addSubViews()
        presenter = MoviesPresenter(view: self)
        presenter.getMovies()
    }
    
    private func cellConfig(cell: UICollectionViewCell) {
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
    }
    
    private func addSubViews() {
        view.addSubview(collectionView)
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getMoviesState().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: MoviePreviewCell.self, for: indexPath)
        cell.config(item: presenter.getMoviesState()[indexPath.row])
        cellConfig(cell: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 30, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetails = MovieDetailsViewController(movieID: presenter.getMoviesState()[indexPath.row].id)
        self.navigationController?.pushViewController(movieDetails, animated: true)
    }
    
}

extension MoviesViewController: MoviesView {
    func updateView() {
        collectionView.reloadData()
    }
}


