//
//  ViewController.swift
//  InterfaceTest
//
//  Created by Downey, Eric on 12/4/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var manager: DataManager = Singleton.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.create(data: "Hello")
        manager.delete(data: "Hello")
        
        // This will not compile.  Interface DataManager does not contain doSomething function
//        manager.doSomething()
        
        Singleton.shared.doSomething()
    }
}

