//
//  Singleton.swift
//  InterfaceTest
//
//  Created by Downey, Eric on 12/4/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public class Singleton: DataManager {
    static let shared: Singleton = Singleton()
    
    private init() {}
    
    public func create(data: Any) {
        print("Create: \(data)")
    }
    public func delete(data: Any) {
        print("Delete: \(data)")
    }
    
    func doSomething() {
        print("doSomething")
    }
}
