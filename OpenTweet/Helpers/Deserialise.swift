//
//  Deserialise.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

protocol Deserialisable {
    static func from(json: [String: Any]) throws -> Self
}

extension Deserialisable where Self: Decodable {
    static func from(json: [String: Any]) throws -> Self {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601Full)
        return try decoder.decode(Self.self, from: json.data)
    }
}

extension Timeline: Deserialisable {}

