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
        let collectionView = UICollectionView()
        collectionView.frame = view.bounds
        return collectionView
    }()
    
    let cellReuseIdentifier = "MoviePreview"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
    }
    
    func createCollectionView() {
        myCollectionView.register(MoviePreview.self, forCellWithReuseIdentifier: "MoviePreview")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        view.addSubview(myCollectionView)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
