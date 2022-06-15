//
//  PostData.swift
//  SwiftUI-Test01
//
//  Created by KimJongHee on 2022/06/15.
//

import Foundation

// MARK: - PostElement
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
