//
//  Dispatcher.swift
//  Flux
//
//  Created by Ruben Roques on 15/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit
import Bond

public class Dispatcher {
    
    var dispatching: Bool = false
    
    var callbacksDictionary: [ String: [ActionCallback]] = [ : ]
    var pendingDictionary: [String: (Bool)] = [:]
    var handledDictionary: [String: (Bool)] = [:]
    
    var pendingAction: Action?
    
    static let sharedInstance = Dispatcher()
    init() { }
    
    func register(callback: ActionCallback, action:ActionRoute) -> String {

        let id = NSUUID().UUIDString

        if let _ = callbacksDictionary[action] {
            callbacksDictionary[id]!.append(callback)
        }else {
            callbacksDictionary[action] = [callback]
        }
        return id
    }
    
    func unregister(id: String) {
        if contains(callbacksDictionary.keys, id) {
            callbacksDictionary.removeValueForKey(id)
        }
    }
    
    func dispatch(payload: Action) {
        
        if !dispatching {
            
            startDispatching(payload)
            
            for id in callbacksDictionary.keys {
                if pendingDictionary[id] == true {
                    continue
                }
                invokeActionCallback(id)
            }
            
            stopDispatching()
            
        }else {
            debugPrintln("Cannot dispatch in the middle of a dispatch.")
        }
    }
    
    // Private
    private func invokeActionCallback(id: String) {
        pendingDictionary[id] = true
        let callbacks = callbacksDictionary[id]!
        for callback in callbacks {
            if let pendingAction = pendingAction {
                callback(pendingAction)
            }
        }
        handledDictionary[id] = true
    }
    
    private func startDispatching(payload: Action) {
        for id in callbacksDictionary.keys {
            pendingDictionary[id] = false
            handledDictionary[id] = false
        }
        pendingAction = payload
        dispatching = true
    }
    
    private func stopDispatching() {
        pendingAction = nil
        dispatching = false
    }
}