//
//  LoginAction.swift
//  FluxDemo
//
//  Created by Ruben Roques on 16/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit

enum LoginAction : Action {
    case PerformLogin(user:String, pass:String)
    case PerformLogout
}

extension LoginAction: Printable {
    var description: String {
        get {
            switch self {
            case let .PerformLogin(user: user, pass: pass):
                return "PerformLogin \(user):\(pass)"
            case .PerformLogout:
                return "PerformLogout"
            }
        }
    }
}