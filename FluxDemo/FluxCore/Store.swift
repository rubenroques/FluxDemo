//
//  Store.swift
//  FluxDemo
//
//  Created by Ruben Roques on 16/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit

protocol Store {
    typealias ActionType = Action
    func performAction(_: ActionType)
    //func filterAction() -> (_:ActionType)->(Bool)
}
