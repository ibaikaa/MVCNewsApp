//
//  NewsAPI.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 22/4/23.
//

import Moya

enum NewsAPI: TargetType {
    case topHeadlinesForCountry(named: String)
    case everything
    
    var baseURL: URL {
        URL(string: "https://newsapi.org/v2/")!
    }
    
    var path: String {
        switch self {
        case .topHeadlinesForCountry:
            return "top-headlines"
        case .everything:
            return "everything"
        }
    }
    
    var method: Method {
        switch self {
        case .topHeadlinesForCountry:
            return .get
        case .everything:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .topHeadlinesForCountry(named: let country):
            return .requestParameters(
                parameters: ["country": country],
                encoding: URLEncoding.default
            )
        case .everything:
            return .requestParameters(parameters: ["q": "apple"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer \(Constants.shared.getAPIKey())"]
    }
    
}


