//
//  URLManager.swift
//  getMem
//
//  Created by Евгений on 18.02.2025.
//

import Foundation


class UrlManager {
    static let shared = UrlManager(); private init() {}

    
    func createURL() -> URL? {
        let fullUrl = "https://api.imgflip.com/get_memes"
        return URL(string: fullUrl)
    }
}
