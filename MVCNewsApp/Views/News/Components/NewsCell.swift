//
//  NewsCell.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 23/4/23.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    static let identifier = String(describing: NewsCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var newsPictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePublishedLabel: UILabel!
    
    func setupCell(with article: Article) {
        newsPictureImageView.kf.setImage(
            with: URL(string: article.urlToImage ?? ""),
            placeholder: UIImage(named: "newsIcon")
        )
        
        titleLabel.text = article.title
        datePublishedLabel.text = article.publishedAt
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
}
