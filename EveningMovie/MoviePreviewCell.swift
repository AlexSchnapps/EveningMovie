//
//  MovieCell.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 06.04.2023.
//

import UIKit
import SnapKit

class MoviePreviewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private lazy var ratingLabel: UILabel = {
        let rating = UILabel()
        rating.textAlignment = .center
        rating.textColor = .black
        rating.backgroundColor = .white
        rating.layer.masksToBounds = true
        rating.layer.cornerRadius = 15
        return rating
    }()
    private lazy var annotetionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    func config(item: Post) {
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 10
        imageView.image = item.image
        nameLabel.text = item.title
        ratingLabel.text = "\(item.rating)"
        annotetionLabel.text = item.description
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(annotetionLabel)
    }
    
    private func addConstraints() {
        imageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(10)
            $0.width.equalTo((contentView.bounds.height - 20) * 0.675)
        }
        nameLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
        }
        annotetionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.lessThanOrEqualToSuperview().inset(10)
        }
        ratingLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading).inset(5)
            $0.bottom.equalTo(imageView.snp.bottom).inset(5)
            $0.width.height.equalTo(30)
        }
    }
}
