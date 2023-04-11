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
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        return collectionView
    }()
    
    private var mockArray: [Movie] = []
    
    
    private let cellReuseIdentifier = "MoviePreviewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            addMockArray()
        }
        //addMockArray()
        createCollectionView()
        
    }
    
    private func addMockArray() {
        mockArray.append(
            Movie(
                name: "John Wick: Chapter 4",
                image: #imageLiteral(resourceName: "JohnWick"),
                rating: 7.8,
                annotation: "Джон Уик находит способ одержать победу над Правлением кланов. Но прежде ему предстоит сразиться с новым врагом и его могущественными союзниками")
        )
    }
    
    private func createCollectionView() {
        myCollectionView.register(MoviePreviewCell.self, forCellWithReuseIdentifier: "MoviePreviewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        view.addSubview(myCollectionView)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mockArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviePreviewCell", for: indexPath) as? MoviePreviewCell else { return UICollectionViewCell() }
        cell.config(item: mockArray[indexPath.row])
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 30, height: 200)
    }
    
}
