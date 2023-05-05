//
//  DescriptionMovieViewController.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 21.04.2023.
//

import UIKit
import SnapKit

class DescriptionMovieViewController: UIViewController {
    
    private lazy var descriptionScroll: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.addSubview(descriptionStackView)
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
        imageView.image = UIImage(named: "AppIcon")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var movieTiteleLabel: UILabel = {
        var label = UILabel()
        label.text = "safafnofqofof ofnoifoqifoqifnoqin oqifnioeqfnqoifnoqfn ufucucuciyfiugugou ufigougogiugigigg giugugogouhouhougu uigiugiugiug hiugiugiugiu hiugiugiugiugguig iugiuguigiugiugiug"
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
        settingsVC()
        addSubviews()
        addConstraints()
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
        movieTiteleLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            //$0.bottom.lessThanOrEqualToSuperview().inset(10)
        }
    }
    
    private func addSubviews() {
        descriptionStackView.addArrangedSubview(descriptionImageView)
        descriptionStackView.addArrangedSubview(movieTiteleLabel)
        view.addSubview(descriptionScroll)
    }
    
    private func settingsVC() {
        self.title = "Description"
        self.view.backgroundColor = .white
    }
}
