//
//  Date+Format.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import Foundation

extension Date {
    var dateAndTimeString: String {
        let dateFormatterTemp = DateFormatter()
        dateFormatterTemp.dateFormat = "dd-MMM-y \'at\' h:mm a"
        dateFormatterTemp.timeZone = NSTimeZone.local
        let dateString = dateFormatterTemp.string(from: self)
        return dateString
    }
}
