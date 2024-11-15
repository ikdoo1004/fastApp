//
//  ViewController.swift
//  fastApp
//
//  Created by 김익두 on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    /*
    struct User: Codable {
        let name: String
        let email: String
        let phone: String
        let password: String
    }
    
    var newName = ""
    var newEmail = ""
    var newPhone = ""
    var newPassword = ""
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let runner = UIImage.gifImageWithName("runner")
//        imageView.image = runner
    }
    
    func validate(user:String) -> Bool {
        return !user.isEmpty
    }
    
    @IBAction func loginAction(_ sender: Any) {
        print("Button Action Log: Login Clicked!")
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        
        if let objLoginVC = loginVC{
            self.navigationController?.pushViewController(objLoginVC, animated: true)
        }
    }
    /*
    @IBAction func nameInput(_ sender: Any) {
    }
    @IBAction func emailInput(_ sender: Any) {
    }
    @IBAction func phoneInput(_ sender: Any) {
    }
    @IBAction func passwordInput(_ sender: Any) {
    }
    *
    @IBAction func registerButton(_ sender: Any) {
        if newName.isEmpty || newEmail.isEmpty || newPhone.isEmpty || newPassword.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please fill in all the fields.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "This closes alert"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }
                                         )
            )
        } else {
            User.init(name: newName, email: newEmail, phone: newPhone, password: newPassword)
            let note = "\(newName) has been registered.\nPlease login to your account."
            
        }
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
    */
}
