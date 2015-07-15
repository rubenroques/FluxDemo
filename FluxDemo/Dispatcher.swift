//
//  Dispatcher.swift
//  Flux
//
//  Created by Ruben Roques on 15/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit



typealias Route = String

protocol Action {
    func route() -> Route
}

protocol Store {
    typealias ActionType = Action
    func performAction(_: ActionType)
}


class Dispatcher {


    private static let instance : Dispatcher = {
        let dispatcher = Dispatcher()
        return dispatcher
        }()

    func register<Store>(store:Store, route:Route) {

    }

    func registerDepency<T:Store>(store:T, dependency:T) {
        //...
    }
}

//
extension Dispatcher {
    func dispatch (action:LoginAction) {
        switch action {
        case let .PerformLogin(user, pass):
            print("\(user) \(pass)")
        case .PerformLogout:
            print("")
        default :
            print("")
        }
    }
}


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

class LoginStore:Store {

    typealias ActionType = LoginAction

    var isLoggedIn = false
    var userName : String = ""

    init() {
        Dispatcher.instance.register(self, route: "LoginStore/*")
    }

    func performAction(action:ActionType) {
        switch action {
        case .PerformLogin:
            self.userName = "User 1"
            self.isLoggedIn = true
            print("Login: Done")
        case .PerformLogout:
            self.userName = ""
            self.isLoggedIn = false
            print("Log out: Done")
        default:
            print("Ignore")
        }
    }
}

class LoginView {
    let store = LoginStore()
    let label = UILabel()

    func bind() {
        //Using github.com/SwiftBond/Bond
        //self.store.isLoggedIn ->> self.label.text
    }
    func sendButtonPressed() {
        Dispatcher.instance.dispatch(LoginAction.PerformLogin(user: "Comment", pass: "Pass"))
    }
}






