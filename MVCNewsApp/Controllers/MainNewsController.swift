//
//  MainNewsController.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 23/4/23.
//

import UIKit

final class MainNewsController {
    private weak var vc: MainNewsView?
    
    init(view: MainNewsView) { self.vc = view }
    
    // MARK: - Private properties
    private let allCountries = SupportedCountries.allCases
    private let networkLayer = NetworkLayer.shared
    private var articles = [Article]() {
        didSet {
            vc?.reloadDataForNewsTableView()
        }
    }
    
    // MARK: - Public methods
    public func getArticles() {
        networkLayer.fetchNews { result in
            switch result {
            case .success(let news):
                self.articles = news.articles ?? []
            case .failure(let error):
                AlertShower.showAlert(
                    title: "Error",
                    message: error.localizedDescription,
                    for: self.vc!
                )
            }
        }
    }
    
    // MARK: - For UIPickerView
    // Number of rows for CountryPickerView
    public func defaultTitleForRow() -> String { allCountries[0].rawValue } // 🗺️ All
    public func numberOfRowsForPickerView() -> Int { allCountries.count }
    public func titleForRow(_ row: Int) -> String { allCountries[row].rawValue }
    
    // MARK: - For UITableView
    
    /// Number of rows for NewsTableView
    public func numberOfRows() -> Int { articles.count }
    public func articleForRow(at indexPath: IndexPath) -> Article { articles[indexPath.row] }
    
}
