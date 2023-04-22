//
//  NetworkLayer.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 22/4/23.
//

import Moya

final class NetworkLayer {
    static let shared = NetworkLayer()
    private init () { }
    
    private let provider = MoyaProvider<NewsAPI>()
    
    public func fetchNews() {
        provider.request(.topHeadlines) { result in
            switch result {
            case .success(let response):
                do {
                    print(response.debugDescription)
                    let news = try JSONDecoder().decode(News.self, from: response.data)
                    print(news)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
