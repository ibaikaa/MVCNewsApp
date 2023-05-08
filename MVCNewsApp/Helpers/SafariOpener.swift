//
//  SafariOpener.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 9/5/23.
//

import SafariServices

final class SafariOpener {
    static let shared = SafariOpener()
    
    public func openSafari(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .fullScreen
        
        if let windowScene = UIApplication.shared
            .connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            let windows = windowScene.windows
            if let window = windows.first {
                window.rootViewController?.present(safariVC, animated: true)
            }
        }
    }
    
}
