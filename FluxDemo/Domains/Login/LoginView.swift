//
//  LoginView.swift
//  FluxDemo
//
//  Created by Ruben Roques on 16/07/15.
//  Copyright (c) 2015 RRocks. All rights reserved.
//

import UIKit
import Bond

class LoginView: UIView {
    
    let dispatcher = Dispatcher.sharedInstance
    let store = LoginStore.sharedInstance

    var label: UILabel = {
        let label = UILabel()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textColor = UIColor.blackColor()
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.systemFontOfSize(10)
        return label
    }()
    
    override func layoutSubviews() {
        self.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)
        
        self.addSubview(label)
        
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0))

        bind()
    }
    
    func bind() {
        self.store.userName ->> self.label
    }
    /*
    func buttonPressed() {
        dispatcher.dispatch( LoginAction.PerformLogin(user: "User", pass: "Pass") )
    }
    */
}
