//
//  Tweet.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

struct Tweet: Codable {
    let id: String
    let author: String
    let content: String
    let avatatUrl: URL?
    let date: Date?
    
    var displayDate: String {
        date?.dateAndTimeString ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case content
        case avatatUrl = "avatar"
        case date
    }
}
