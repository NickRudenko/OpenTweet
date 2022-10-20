//
//  TweetCellViewModel.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation
import ReactiveKit

final class TweetCellViewModel {
    
    let author = Property<String>("")
    let content = Property<String>("")
    let date = Property<String>("")
    let avatarUrl = Property<URL?>(nil)
    
    var model: Tweet? {
        didSet {
            guard let model = model else { return }
            author.value = model.author
            content.value = model.content
            date.value = model.displayDate
            avatarUrl.value = model.avatatUrl
        }
    }
}
