//
//  viewTesting.swift
//  fastApp
//
//  Created by 김익두 on 11/13/24.
//  Class of Sagar

import UIKit

// UIRootViewController -> A -> B ...

class ViewTesting: UIViewController {
    
    // view controller lifecycle refers to methods called
    // when view controller is created, displayed and removed from chain.
    // these allow handling user interaction and updating ui as needed
    
    @IBAction func exitApp(_ sender: UIButton) {
        print("Exit button tapped - Terminating the app.")
                exit(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // -> after view controller been LOADED to memory.
        // -> initialize the obj, setup data and make all necessary things
        // only when view is first created
        print("viewDidLoad - view has loaded into memory.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // everytime view is about to appear
        // used when updates are made before view become visible
        print("viewWillAppear - view is about to appear on the screen.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // right before view is removed /invisible/ from screen
        //
        print("viewWillDisappear - view is about to disappear from the screen.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // after when view is added to window on screen
        // performance is made after view is visible. ex) start animation or download data
        print("viewDidAppear - view has appeared on the screen.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // after view been removed from screen, usable when you want to clean or releasing resource (ex - free())
        print("viewDidDisappear - view has disappeared from the screen.")
    }
}

/*
 app 5 lifecycle
 Activated, Inactivated, Background, Not running, Suspended
 
 Not running - app is terminated OR not been launched
 Inactive - app is running, not receiving any events // when using an app you attend a call
 active - app is running, receiving events
 background - app is running, not in foreground : music listening, etc
 suspended - app is running, executing in code // not even receiving notification
 
 */

// task: print every lifecycle of view controller
