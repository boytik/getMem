//
//  MemeModel.swift
//  getMem
//
//  Created by Евгений on 18.02.2025.
//

import Foundation
struct MemeData: Decodable {
    var data: MemeModel
}
struct MemeModel: Decodable {
    var memes: [Meme]
}

struct Meme: Decodable {
    let id: String
    let name: String
    let url: String
    let width: Int
    let height: Int
    let box_count: Int
    let captions: Int
}
