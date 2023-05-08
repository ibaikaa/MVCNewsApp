//
//  NoNewsFoundView.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 2/5/23.
//

import UIKit

final class NoNewsFoundView: UIView {
    private lazy var noNewsFoundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "noNewsFoundIcon"))
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private lazy var noNewsFoundLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private func setupSubviews() {
        addSubview(noNewsFoundImageView)
        noNewsFoundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let noNewsFoundImageViewConstraints = [
            noNewsFoundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            noNewsFoundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            noNewsFoundImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            noNewsFoundImageView.heightAnchor.constraint(equalTo: noNewsFoundImageView.widthAnchor)
        ]
        
        addSubview(noNewsFoundLabel)
        noNewsFoundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let noNewsFoundLabelConstraints = [
            noNewsFoundLabel.topAnchor.constraint(
                equalTo: noNewsFoundImageView.bottomAnchor,
                constant: 20
            ),
            noNewsFoundLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            noNewsFoundLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(noNewsFoundImageViewConstraints)
        NSLayoutConstraint.activate(noNewsFoundLabelConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupSubviews()
    }
    
    public func setupDescription(noNewsFoundFor country: String) {
        noNewsFoundLabel.text = "No news found for \(country) \(country) yet 😔. Try again later!"
    }

}
