//
//  TimelineViewModel.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation
import ReactiveKit

class TimelineViewModel {
    let tweets = Property<[Tweet]>([])
    
    private let tweetsContext: TweetsQueryable
    
    init(tweetsContext: TweetsQueryable = TweetsContext()) {
        self.tweetsContext = tweetsContext
        fetchTweets()
    }
    
    private func fetchTweets() {
        guard let timeline = tweetsContext.fetchTimeline() else {
            tweets.value = []
            return
        }
        tweets.value = timeline.tweets
    }
}
