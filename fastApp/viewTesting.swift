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
    var code = 0
    
    @IBAction func exitApp(_ sender: UIButton) {
        print("Exit button tapped - Terminating the app.")
        exit(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // -> after view controller been LOADED to memory.
        // -> initialize the obj, setup data and make all necessary things
        // only when view is first created
        //print("viewDidLoad - view has loaded into memory.")
        printLifeCycle(code: 0, functionName: "viewDidLoad")
        testTask1N2()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // everytime view is about to appear
        // used when updates are made before view become visible
        //print("viewWillAppear - view is about to appear on the screen.")
        printLifeCycle(code: 11, functionName: "viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // right before view is removed /invisible/ from screen
        //
        //print("viewWillDisappear - view is about to disappear from the screen.")
        printLifeCycle(code: 12, functionName: "viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // after when view is added to window on screen
        // performance is made after view is visible. ex) start animation or download data
        //print("viewDidAppear - view has appeared on the screen.")
        printLifeCycle(code: 21, functionName: "viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // after view been removed from screen, usable when you want to clean or releasing resource (ex - free())
        //print("viewDidDisappear - view has disappeared from the screen.")
        printLifeCycle(code: 22, functionName: "viewDidDisappear")
    }
    
    // task1: string to int conversion
    func convertToInt(from string: String) -> Int? {
        // optional 'Int?' because converting a string to int might fail
        if let intValue = Int(string) { return intValue } else { return nil}
    }
    
    // task2: string array to optional int array
    func convertToIntArray(from strings: [String]) -> [Int?] {
        var intArray: [Int?] = []
        
        for string in strings {
            if let intValue = Int(string) {
                intArray.append(intValue)   // it appends either an integer or nil
            }
        }
        
        return intArray
    }
    
    // task3: printing lifecycle so it simplify code
    func printLifeCycle(code: Int, functionName: String) {
        // rule here is that the code number separates by each category:
        // ex) '1' '1' is 'will' 'appear', '2' '2' are 'did' 'disappear'. By combinations, it prints each message by each functions
        switch code {
        case 0:
            print("\(functionName) - View has loaded into memory.")
            break
        case 11:
            print("\(functionName) - View is about to appear on the screen.")
            break
        case 12:
            print("\(functionName) - View is about to disappear from the screen.")
            break
        case 21:
            print("\(functionName) - View has appeared on the screen.")
            break
        case 22:
            print("\(functionName) - View has disappeared from the screen.")
            break
        default:
            print("Unknown event code.")
            break
        }
    }
    
    // task 1 & 2 testing function
    func testTask1N2() {
        // task 1
        print("---Task 1 testingg:")
        
        let validStr = "123"
        let invalidStr = "abc"
        let mixed = "123abc"
        
        if let result = convertToInt(from: validStr) {
            print("convert(\(validStr)) -> \(result)") // output 123
        } else {
            print("convert(\(validStr)) -> nil")
        }
        
        if let result = convertToInt(from: invalidStr) {
            print("convert(\(invalidStr)) -> \(result)")
        } else {
            print("convert(\(invalidStr)) -> nil") // output nil
        }
        
        if let result = convertToInt(from: mixed) {
            print("convert(\(mixed)) -> \(result)")
        } else {
            print("convert(\(mixed)) -> nil") // nil?
        }
        
        // Task 2 Tests
        print("---Task 2 testing:")
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

/*
 functions? - function is a block of code that performs specific task
 
 Tasks:
 1. Create a function that takes a string as input and returns an optional integer. If the string can be converted to an integer, return the integer value; otherwise, return nil.
 
 2. Implement a function that takes an array of strings and returns an array of optional integers. Use appropriate methods to unwrap the optionals and filter out any nil values.
 
 3) And simplify the code of printing messages above by using functions.
 */

