//
//  jsonStruct.swift
//  JsonParsingHomework
//
//  Created by AR on 2.11.22.
//

import Foundation

struct Comments: Codable {
    let id: Int
    let body: String
    let postId: Int
}

struct User: Codable {
    let id: Int
    let username: String
}

struct Stat: Codable {
    let total: Int
    let skip: Int
    let limit: Int
}
