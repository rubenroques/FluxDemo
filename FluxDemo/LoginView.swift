//
//  LoginView.swift
//  FluxDemo
//
//  Created by Ruben Roques on 16/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit
import Bond

class LoginView {
    let store = LoginStore()
    let label = UILabel()

    func bind() {
        self.store.userName ->> self.label
    }
    func sendButtonPressed() {
        Dispatcher.instance.dispatch(LoginAction.PerformLogin(user: "Comment", pass: "Pass"))
    }
}
