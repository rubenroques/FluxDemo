//
//  ViewController.swift
//  FluxDemo
//
//  Created by Ruben Roques on 15/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit


let dispatcher = Dispatcher.sharedInstance

class ViewController: UIViewController {
    
    var loginView1: LoginView = {
        return LoginView(frame: CGRect(x: 15, y: 80, width: 190, height: 30))
    }()
    
    var loginView2: LoginView = {
        return LoginView(frame: CGRect(x: 15, y: 130, width: 190, height: 30))
    }()
    
    var userNameView: RefreshUserView = {
        return RefreshUserView(frame: CGRect(x: 15, y: 170, width: 190, height: 30))
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.addSubview(loginView1)
        self.view.addSubview(loginView2)
        self.view.addSubview(userNameView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func testLogin(sender: AnyObject?) {
        //dispatcher.dispatch( LoginAction.PerformLogin(user: "User", pass: "Pass") )
    }
    
    
    @IBAction func testUserName(sender: AnyObject?) {
        //dispatcher.dispatch( RefreshUserAction.RefreshUserFirstName )
        //dispatcher.dispatch( RefreshUserAction.RefreshUserLastName )
    }
}

