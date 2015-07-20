//
//  Action.swift
//  FluxDemo
//
//  Created by Ruben Roques on 16/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit

typealias ActionRoute = String

protocol Action {

    var actionRoute : ActionRoute {get}

}


typealias ActionCallback = Action -> ()
