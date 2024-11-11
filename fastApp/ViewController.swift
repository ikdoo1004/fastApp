//
//  ViewController.swift
//  fastApp
//
//  Created by 김익두 on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerNotAvailable(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "No Register process is yet available.", preferredStyle: .alert)

                // You can add actions using the following code
                alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "This closes alert"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))

                // This part of code inits alert view
                self.present(alert, animated: true, completion: nil)
    }
    
}

