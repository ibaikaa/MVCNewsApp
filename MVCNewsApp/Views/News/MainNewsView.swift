//
//  MainNewsView.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 22/4/23.
//

import UIKit

final class MainNewsView: UIViewController {
    // MARK: - Private properties
    private var controller: MainNewsController?
    
    // MARK: - UI-components
    @IBOutlet private weak var countryTextField: UITextField!
    @IBOutlet private weak var newsTableView: UITableView!
    
    private var countryPickerView = UIPickerView()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    @objc
    func refresh(_ sender: UIRefreshControl) {
        print("CALL API")
        newsTableView.reloadData()
        sender.endRefreshing()
    }
    
    // MARK: - Private methods
    private func configureController() {
        controller = MainNewsController(view: self)
    }
    
    private func configurePickerView() {
        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        countryTextField.inputView = countryPickerView
    }
    
    private func configureNewsTableView() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.register(NewsCell.nib, forCellReuseIdentifier: NewsCell.identifier)
        newsTableView.refreshControl = refreshControl
    }
    
    private func callApi() {
        controller?.getArticles()
    }
    
    // MARK: - Public methods
    public func reloadDataForNewsTableView() {
        newsTableView.reloadData()
    }
    
    // MARK: - UIViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        configurePickerView()
        configureNewsTableView()
        countryTextField.text = controller?.defaultTitleForRow()
        callApi()
    }

}

// MARK: - UIPickerViewDataSource
extension MainNewsView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        guard let numberOfRows = controller?.numberOfRowsForPickerView() else {
            AlertShower.showAlert(title: "Error", message: "Try again", for: self)
            return 0
        }
        
        return numberOfRows
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        controller?.titleForRow(row)
    }

}

// MARK: - UIPickerViewDelegate
extension MainNewsView: UIPickerViewDelegate {
    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        countryTextField.text = controller?.titleForRow(row)
    }
    
}

// MARK: - UITableViewDataSource
extension MainNewsView: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        controller?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(
            withIdentifier: NewsCell.identifier,
            for: indexPath
        ) as? NewsCell else {
            fatalError("MainNewsView. Error. \n Message: xib not found for NewsCell")
        }
        
        if let article = controller?.articleForRow(at: indexPath) {
            cell.setupCell(with: article)
        } else {
            AlertShower.showAlert(
                title: "Error",
                message: "Cant load data. Try again later.",
                for: self
            )
        }
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension MainNewsView: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat { 200 }
    
}
