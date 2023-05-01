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
    private var decoder = JSONDecoder()
    
    private func decode<T: Decodable>(type: T.Type, data: Data) throws -> T {
         try decoder.decode(type, from: data)
    }
    
    public func fetchNews(for country: String, completion: @escaping (Result<News, Error>) -> Void) {
        provider.request(.topHeadlinesForCountry(named: country)) { [weak self] result in
            guard let `self` = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    let news = try self.decode(type: News.self, data: response.data)
                    completion(.success(news))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
