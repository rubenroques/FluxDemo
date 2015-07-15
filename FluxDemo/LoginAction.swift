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

    func route() -> Route {
        switch self {
        case .PerformLogin:
            return "LoginAction/PerformLogin"
        case .PerformLogout:
            return "LoginAction/PerformLogin"
        }
    }
}