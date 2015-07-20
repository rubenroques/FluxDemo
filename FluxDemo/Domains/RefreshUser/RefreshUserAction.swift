//
//  LoginAction.swift
//  FluxDemo
//
//  Created by Ruben Roques on 16/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit

enum RefreshUserAction : Action {
    case RefreshUserFirstName
    case RefreshUserLastName
}

extension RefreshUserAction {

    var actionIdentifier : Route {
        return "\(RefreshUserAction.self)"
    }

}