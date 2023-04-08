//
//  ViewController.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 06.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        return collectionView
    }()
    
    let cellReuseIdentifier = "MoviePreviewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
    }
    
    func createCollectionView() {
        myCollectionView.register(MoviePreviewCell.self, forCellWithReuseIdentifier: "MoviePreviewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        view.addSubview(myCollectionView)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePreviewCell", for: indexPath) as? MoviePreviewCell else { return UICollectionViewCell() }
        cell.config(image: UIImage(systemName: "info.circle")!)
        return cell
    }
    
    
}
