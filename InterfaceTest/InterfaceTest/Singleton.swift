//
//  Singleton.swift
//  InterfaceTest
//
//  Created by Downey, Eric on 12/4/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

class Singleton: DataManager {
    static let shared: Singleton = Singleton()
    
    private init() {}
    
    func create(data: Any) {
        print("Create: \(data)")
    }
    func delete(data: Any) {
        print("Delete: \(data)")
    }
    
    func doSomething() {
        print("doSomething")
    }
}
