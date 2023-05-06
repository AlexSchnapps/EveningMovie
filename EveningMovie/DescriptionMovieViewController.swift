//
//  DescriptionMovieViewController.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 21.04.2023.
//

import UIKit
import SnapKit

class DescriptionMovieViewController: UIViewController {
    
    private let movieID: String
    private let networkManager = NetworkManager()
    
    private lazy var descriptionScrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize = self.descriptionStackView.bounds.size
        return scrollView
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .lightGray
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.layer.masksToBounds = true
        stackView.layer.cornerRadius = 10
        
        return stackView
    }()
    
    private lazy var descriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.backgroundColor = .lightGray
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    init(movieID: String) {
        self.movieID = movieID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieDescription()
        settingsVC()
    }
    
    private func addConstraints() {
        descriptionStackView.snp.makeConstraints {
            //$0.edges.equalToSuperview().inset(10)
            $0.top.leading.equalToSuperview().inset(10)
            $0.trailing.bottom.equalToSuperview().offset(10)
            $0.width.equalTo(view.bounds.width - 20)
        }
        descriptionImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.height.equalTo(descriptionImageView.snp.width)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            //$0.bottom.lessThanOrEqualToSuperview().inset(10)
        }
    }
    
    private func addSubviews() {
        view.addSubview(descriptionScrollView)
        descriptionScrollView.addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(descriptionImageView)
        descriptionStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func settingsVC() {
        self.title = "Description"
        self.view.backgroundColor = .white
    }
    
    private func getMovieDescription() {
        networkManager.obtainPostDescription(id: movieID) { [weak self] (result) in
            switch result {
            case .success(let post) :
                print(post)
                DispatchQueue.main.async {
                    self?.config(item: post)
                }
            case .failure(let error) :
                print("Error: \(error.localizedDescription)")
                
            }
        }
    }
    
    private func config(item: Post) {
        descriptionImageView.downloadImage(from: item.image)
        //nameLabel.text = item.title
        //ratingLabel.text = "\(item.rating)"
        descriptionLabel.text = item.description
        
        addSubviews()
        addConstraints()
    }
    
}
