//
//  ViewController.swift
//  LifecycleTest
//
//  Created by Downey, Eric on 12/4/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var displayFrames: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n\n\n\n")
        print("\(self) - View Did Load")
        printFrame()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self) - View Will Appear")
        printFrame()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(self) - View Did Appear")
        printFrame()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("\(self) - View Will Layout Subviews")
        printFrame()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("\(self) - View Did Layout Subviews")
        printFrame()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(self) - View Will Disappear")
        printFrame()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(self) - View Did Disappear")
        printFrame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("\(self) - Did Receive Memory Warning")
    }
    
    // MARK: - Actions
    
    @IBAction func close() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    // MARK: - Frames
    
    func printFrame() {
        guard displayFrames else { return }
        print("\n")
        print("Frame: ****************")
        print("\(self) - \(view.frame)")
        let button = view.subviews.first
        print("button - \(button?.frame)")
        print("***********************")
        print("\n")
    }
}

class GreenViewController: BaseViewController {
    override var description: String {
        return "Green View Controller"
    }
    
    override var debugDescription: String {
        return "Green View Controller"
    }
}

class OrangeViewController: BaseViewController {
    override var description: String {
        return "Orange View Controller"
    }
    
    override var debugDescription: String {
        return "Orange View Controller"
    }
}
