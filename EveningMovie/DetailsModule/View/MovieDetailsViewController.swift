//
//  DescriptionMovieViewController.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 21.04.2023.
//

import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    
    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize = self.stackView.bounds.size
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .lightGray
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 10
        
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var label: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.backgroundColor = .lightGray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getMovieDescription()
        settingsVC()
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
            $0.trailing.bottom.equalToSuperview().offset(10)
            $0.width.equalTo(view.bounds.width - 20)
        }
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.height.equalTo(imageView.snp.width)
        }
        label.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
    }
    
    private func settingsVC() {
        self.title = Constants.titleDetails
        self.view.backgroundColor = .white
    }
}

extension MovieDetailsViewController: MovieDetailsView {
    func updateView(item: Movie) {
        imageView.downloadImage(from: item.image)
        //nameLabel.text = item.title
        //ratingLabel.text = "\(item.rating)"
        label.text = item.description
        
        addSubviews()
        addConstraints()
    }
}

