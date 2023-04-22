//
//  Constants.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 22/4/23.
//

import Foundation

final class Constants {
    static let shared = Constants()
    private init () { }
    
    private let API_KEY = "5b42ef5c689c40109d3ae937cec2a0ab"
    
    public func getAPIKey() -> String { API_KEY }
    
}
