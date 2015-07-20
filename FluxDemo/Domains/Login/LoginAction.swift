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

extension LoginAction {
    var actionRoute : ActionRoute {
        return "\(LoginAction.self)"
    }
}