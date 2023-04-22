//
//  NewsAPI.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 22/4/23.
//

import Moya

enum NewsAPI: TargetType {
    case topHeadlines
    case everything
    
    var baseURL: URL {
        URL(string: "https://newsapi.org/v2/")!
    }
    
    var path: String {
        switch self {
        case .topHeadlines:
            return "top-headlines"
        case .everything:
            return "everything"
        }
    }
    
    var method: Method {
        switch self {
        case .topHeadlines:
            return .get
        case .everything:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .topHeadlines:
            return .requestParameters(parameters: ["country": "us"], encoding: URLEncoding.default)
        case .everything:
            return .requestParameters(parameters: ["q": "apple"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer \(Constants.shared.getAPIKey())"]
    }
    
}
