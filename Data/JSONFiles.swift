//
//  JSONFiles.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

enum JSONFiles {
    enum Tweets {
        public static let timeline = StubJSONFile.json(from: "timeline", folderPath: "")
    }
}
