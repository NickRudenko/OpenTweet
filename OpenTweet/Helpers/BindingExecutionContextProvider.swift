//
//  BindingExecutionContextProvider.swift
//  OpenTweet
//
//  Created by Mykola Rudenko on 20.10.2022.
//  Copyright © 2022 OpenTable, Inc. All rights reserved.
//

import UIKit
import ReactiveKit

extension UIView: BindingExecutionContextProvider {
    public var bindingExecutionContext: ExecutionContext {
        return .immediateOnMain
    }
}

extension UIViewController: BindingExecutionContextProvider {
    public var bindingExecutionContext: ExecutionContext {
        return .immediateOnMain
    }
}
