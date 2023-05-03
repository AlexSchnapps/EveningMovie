//
//  DescriptionMovieViewController.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 21.04.2023.
//

import UIKit
import SnapKit

class DescriptionMovieViewController: UIViewController {

    private lazy var discriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
    }
    
    private func addConstraints() {
        descriptionImageView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview().inset(10)
        }
    }
    
    private func addSubviews() {
        view.addSubview(discriptionStackView)
    }
}
