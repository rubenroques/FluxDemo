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

    var userName : Dynamic<String> = Dynamic("")
    
    //Dispatcher
    let dispatcher = Dispatcher.sharedInstance
    var storeID : String? = nil
    
    static let sharedInstance = LoginStore()  
    
    init() {
        self.storeID = dispatcher.register({action in
            if let actionValue = action as? LoginAction {
                self.performAction(actionValue)
            }
        })
    }
    
    deinit{
        if let storeIDValue = storeID {
            dispatcher.unregister(storeIDValue)
        }
    }
    
    func performAction(action: LoginAction) {
        switch action {
        case .PerformLogin:
            self.performLogin()
            println("Login: Done")
        case .PerformLogout:
            self.userName.value = ""
            println("Log out: Done")
        }
    }
    
    func filterAction() -> (action:Action)->(Bool) {
        return {
            action in
            
            if let actionValue = action as? LoginAction {
                return true
            }
            return false
        }
    }
    
    func performLogin(){
        //
        self.userName.value = "Testing - \(NSDate().timeIntervalSince1970)"
    }
}



