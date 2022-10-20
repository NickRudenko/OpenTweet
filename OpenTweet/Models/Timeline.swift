//
//  Timeline.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

struct Timeline: Codable {
    let tweets: [Tweet]
    
    enum CodingKeys: String, CodingKey {
        case tweets = "timeline"
    }
}
