//
//  MovieCell.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 06.04.2023.
//

import UIKit
import SnapKit

class MoviePreview: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    func config(image: UIImage) {
        imageView.image = image
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(50)
        }
    }
}
