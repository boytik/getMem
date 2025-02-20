//
//  NetWorkService.swift
//  getMem
//
//  Created by Евгений on 18.02.2025.
//

import Foundation
class NetworkService {
    static let shared = NetworkService()
    private init() {}
//    let session: URLSession = .shared
    
    func fetchMemes(completion: @escaping (Result< MemeData, Error>) -> ()) {
        guard let url = UrlManager.shared.createURL() else { return print("URL error")}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("trouble with data")
                return
            }
            do {
                let memes = try JSONDecoder().decode(MemeData.self, from: data)
                completion(.success(memes))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
       
    }
}
