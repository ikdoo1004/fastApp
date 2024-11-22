//
//  LoginVC.swift
//  fastApp
//
//  Created by 김익두 on 11/12/24.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var enterEmail: UITextField!
    @IBOutlet weak var enterPWD: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginCheck(_ sender: Any) {
        guard let enteredEmail = enterEmail.text, !enteredEmail.isEmpty,
              let enteredPassword = enterPWD.text, !enteredPassword.isEmpty else {
            showAlert(message: "Please fill in both fields.")
            return
        }
        
        // credential check
        if validateCredentials(email: enteredEmail, password: enteredPassword) {
            // If authenticated valid, transition to main content
            if let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController {
                navigationController?.pushViewController(tabBarVC, animated: true)
            }
        } else {
            showAlert(message: "Invalid email or password. Please try again.")
        }
    }
    
    // check validation with account storage
    private func validateCredentials(email: String, password: String) -> Bool {
        return Accounts.users.contains { $0.userEmail == email && $0.userPassword == password }
    }
    
    // alert for errors
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

