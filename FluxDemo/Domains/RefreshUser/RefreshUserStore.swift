//
//  LoginStore.swift
//  FluxDemo
//
//  Created by Ruben Roques on 16/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit
import Bond

class RefreshUserStore:Store {
    
    typealias ActionType = RefreshUserAction
    
    var userFirstName : Dynamic<String> = Dynamic("")
    var userLastName : Dynamic<String> = Dynamic("")
    
    //Dispatcher
    let dispatcher = Dispatcher.sharedInstance
    var storeID : String? = nil
    
    
    static let sharedInstance = RefreshUserStore()
    
    init() {
        dispatcher.register({ action in
            if let actionValue = action as? RefreshUserAction {
                self.performAction(actionValue)
            }
        }, action:"")
    }
    
    deinit{
        if let storeIDValue = storeID {
            dispatcher.unregister(storeIDValue)
        }
    }
    
    func performAction(action: RefreshUserAction) {
        switch action {
        case .RefreshUserFirstName:
            self.requestUserFirstName()
        case .RefreshUserLastName:
            self.requestUserLastName()
        }
    }
    
    func requestUserFirstName(){
        //
        self.userLastName.value = randomStringWithLength(5)
    }
    
    
    func requestUserLastName(){
        //
        self.userFirstName.value = randomStringWithLength(8)
    }
    
}


















//

func randomStringWithLength (len : Int) -> String {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    var randomString : NSMutableString = NSMutableString(capacity: len)
    
    for (var i=0; i < len; i++){
        var length = UInt32 (letters.length)
        var rand = arc4random_uniform(length)
        randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
    }
    
    return String(randomString)
}
