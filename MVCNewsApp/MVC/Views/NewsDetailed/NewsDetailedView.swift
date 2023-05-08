//
//  NewsDetailedView.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 2/5/23.
//

import UIKit
import Kingfisher

final class NewsDetailedView: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var newsPictureImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var sourceLabel: UILabel!
    @IBOutlet private weak var datePublishedLabel: UILabel!

    // MARK: - IBActions
    @IBAction private func goToFullArticle(_ sender: Any) {
        guard
            let urlPath = article?.url,
            let url = URL(string: urlPath)
        else {
            AlertShower.showAlert(
                title: "Error",
                message: "Unexpected error occured. Try again later.",
                for: self
            )
            return
        }
        
        SafariOpener.shared.openSafari(with: url)
    }
    
    // MARK: - Private properties
    private var article: Article?
    
    // MARK: - Private methods
    private func setDataToUIElements() {
        newsPictureImageView.kf.setImage(
            with: URL(string: article?.urlToImage ?? ""),
            placeholder: UIImage(named: "newsIcon")
        )

        titleLabel.text = article?.title
        contentLabel.text = article?.content
        sourceLabel.text = "Source: \(article?.source?.name ??  "Anonymous")"
        datePublishedLabel.text = "Published at: \(article?.publishedAt ?? "No data")"
    }
    
    // MARK: - Public methods
    public func setArticle(article: Article) {
        self.article = article
    }
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataToUIElements()
    }

}
