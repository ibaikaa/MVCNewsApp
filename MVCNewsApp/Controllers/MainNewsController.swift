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
    
    private var isLoading: Bool = false {
        didSet { isLoading ? vc?.showLoadingIndicator() : vc?.dismissLoadingIndicator() }
    }
    
    private var isRefreshing: Bool = false {
        didSet { isRefreshing ? vc?.beginRefreshing() : vc?.endRefreshing() }
    }
    
    // MARK: - Private methods
    private func getCountryCode(for country: String) -> String {
        guard let countryCode = SupportedCountries(rawValue: country) else {
            AlertShower.showAlert(
                title: "Error",
                message: "Unexpected error occured. Please, try again later. Showing news for USA now..",
                for: self.vc!
            )
            return "us"
        }
        
        return "\(countryCode)"
    }
    
    // MARK: - Public methods
    public func fetchNews(for country: String) {
        let countryCode = getCountryCode(for: country)
        isLoading = true
        networkLayer.fetchNews(for: countryCode) { [weak self] result in
            guard let `self` = self else { return }
            
            switch result {
            case .success(let news):
                self.articles = news.articles ?? []
                self.isLoading = false
            case .failure(let error):
                AlertShower.showAlert(
                    title: "Error",
                    message: error.localizedDescription,
                    for: self.vc!
                )
                self.isLoading = false
            }
        }
    }
    
    public func refreshNewsOnPull(for country: String) {
        let countryCode = getCountryCode(for: country)
        isRefreshing = true
        
        networkLayer.fetchNews(for: countryCode) { [weak self] result in
            guard let `self` = self else { return }
            
            switch result {
            case .success(let news):
                self.articles = news.articles ?? []
                self.isRefreshing = false
            case .failure(let error):
                AlertShower.showAlert(
                    title: "Error",
                    message: error.localizedDescription,
                    for: self.vc!
                )
                self.isRefreshing = false
            }
        }
        
    }
    
    // MARK: - For UIPickerView
    // Number of rows for CountryPickerView
    public func defaultTitleForRow() -> String {
        SupportedCountries.getCountryRawValueForDefault(default: .us)
    }
    
    public func numberOfRowsForPickerView() -> Int { allCountries.count }
    public func titleForRow(_ row: Int) -> String { allCountries[row].rawValue }
    
    // MARK: - For UITableView
    
    /// Number of rows for NewsTableView
    public func numberOfRows() -> Int { articles.count }
    public func articleForRow(at indexPath: IndexPath) -> Article { articles[indexPath.row] }
    
}
