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

    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let annotetionLabel = UILabel()
    
    func config(item: Movie) {
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 10
        imageView.image = item.image
        nameLabel.text = item.name
        ratingLabel.text = "\(item.rating)"
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .black
        ratingLabel.backgroundColor = .white
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 15
        annotetionLabel.text = item.annotation
        annotetionLabel.font = .systemFont(ofSize: 12, weight: .light)
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        annotetionLabel.numberOfLines = 0
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
            $0.leading.equalToSuperview().offset(5)
            $0.top.equalToSuperview().inset(0)
            $0.bottom.equalToSuperview().inset(0)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(10)
            //$0.width.equalTo(100)
        }
        annotetionLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(165)
            $0.leading.equalTo(imageView.snp.leading).offset(25)
            $0.width.height.equalTo(30)
        }
    }
}
