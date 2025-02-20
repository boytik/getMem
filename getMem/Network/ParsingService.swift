//
//  ParsingService.swift
//  getMem
//
//  Created by Евгений on 18.02.2025.
//

import Foundation

class ParsingService {
    static let shared = ParsingService(); private init() {}
    
    func parseMems(data: Data) -> MemeModel? {
        let decoder = JSONDecoder()
        do {
            let mems = try decoder.decode(MemeModel.self, from: data)
            return mems
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
