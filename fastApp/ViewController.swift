//
//  ViewController.swift
//  fastApp
//
//  Created by 김익두 on 11/11/24.
//  Main view controller (Title screen)

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
    
    @IBAction func exitApp(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "You are just halfway..",
            message: "It always seems impossible until it's done.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "GIVE UP", style: .destructive, handler: { _ in
            // Exit the app
            exit(0)
        }))
        
        alert.addAction(UIAlertAction(title: "Never give up", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        print("Button Action Log: Login Clicked!")
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        
        if let objLoginVC = loginVC{
            self.navigationController?.pushViewController(objLoginVC, animated: true)
        }
    }
    
}
