//
//  TweetContext.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

protocol TweetsQueryable {
    func fetchTimeline() -> Timeline?
}

final class TweetsContext: TweetsQueryable {
    func fetchTimeline() -> Timeline? {
        let json = JSONFiles.Tweets.timeline
        guard let timeline = try? Timeline.from(json: json) else {
            return nil
        }
        return timeline
    }
}
