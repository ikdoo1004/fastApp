//
//  RegisterVC.swift
//  fastApp
//
//  Created by 김익두 on 11/22/24.
//

import UIKit

class RegisterVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameInput.delegate = self
        emailInput.delegate = self
        phoneInput.delegate = self
        passwordInput.delegate = self
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        guard let name = nameInput.text,
              let email = emailInput.text,
              let phone = phoneInput.text,
              let password = passwordInput.text,
              !name.isEmpty, !email.isEmpty, !phone.isEmpty, !password.isEmpty else {
            
            let alert = UIAlertController(title: "Oops!", message: "You should fill out everything!.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK Bro", style: .default, handler: nil)) // Dismiss action
            present(alert, animated: true, completion: nil)
            return
        }
        
        let newUser = userAccount(userName: name, userPassword: password, userEmail: email, userPhone: phone)
        
        Accounts.users.append(newUser)
        
        if let doubleCheckVC = storyboard?.instantiateViewController(withIdentifier: "DoubleCheckVC") as? DoubleCheckVC {
            
            doubleCheckVC.nameStr = name
            doubleCheckVC.emailStr = email
            doubleCheckVC.phoneStr = phone
            doubleCheckVC.pwStr = password
            
            navigationController?.pushViewController(doubleCheckVC, animated: true)
        }
    }
    
}
