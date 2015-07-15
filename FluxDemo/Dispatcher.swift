//
//  Dispatcher.swift
//  Flux
//
//  Created by Ruben Roques on 15/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit
import Bond

class Dispatcher {

    static let instance : Dispatcher = {
        let dispatcher = Dispatcher()
        return dispatcher
    }()

    func register<Store>(store:Store, route:Route) {
        //...
    }

    func registerDepency<T:Store>(store:T, dependency:T) {
        //...
    }
}

// Login Domain Extension
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







