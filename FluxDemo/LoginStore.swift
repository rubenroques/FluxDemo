//
//  LoginStore.swift
//  FluxDemo
//
//  Created by Ruben Roques on 16/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit
import Bond

class LoginStore:Store {

    typealias ActionType = LoginAction

    var isLoggedIn : Dynamic<Bool> = Dynamic(false)
    var userName : Dynamic<String> = Dynamic("")

    init() {
        Dispatcher.instance.register(self, route: "LoginStore/*")
    }

    func performAction(action:ActionType) {
        switch action {
        case .PerformLogin:
            self.userName.value = "User 1"
            self.isLoggedIn.value = true
            print("Login: Done")

        case .PerformLogout:
            self.userName.value = ""
            self.isLoggedIn.value = false
            print("Log out: Done")

        default:
            print("Ignore")
        }
    }
}



