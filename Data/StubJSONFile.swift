//
//  StubJSONFile.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

class StubJSONFile: NSObject {
    static func json(from fileName: String, folderPath: String) -> [String: Any] {
        let path = (folderPath as NSString).appendingPathComponent(fileName)
        guard let url = Bundle(for: self).url(forResource: path, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let object = try? JSONSerialization.jsonObject(with: data, options: []),
            let dictionary = object as? [String: Any] else {
            fatalError("No json file found for \(fileName)")
        }
        return dictionary
    }
}

extension Dictionary {
    var data: Data {
        return try! JSONSerialization.data(withJSONObject: self, options: [])
    }
}
