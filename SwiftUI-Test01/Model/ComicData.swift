//
//  ComicData.swift
//  SwiftUI-Test01
//
//  Created by KimJongHee on 2022/06/15.
//

import Foundation

struct APIComicResult: Codable {
    var data: APIComicData
}

struct APIComicData: Codable {
    var count: Int
    var results: [Comic]
}

struct Comic: Identifiable, Codable {
    
    var id: Int
    var title: String
    var description: String?
    var thumbnail: [String : String]
    var urls: [[String : String]]
}
