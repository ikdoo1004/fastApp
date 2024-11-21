//
//  DoubleCheckVC.swift
//  fastApp
//
//  Created by 김익두 on 11/22/24.
//

import UIKit

class DoubleCheckVC: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    var nameStr: String?
    var emailStr: String?
    var phoneStr: String?
    var pwStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = "User name: \(nameStr ?? "")"
        email.text = "Email: \(emailStr ?? "")"
        phone.text = "Phone: \(phoneStr ?? "")"
        password.text = "Password: \(pwStr ?? "")"
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        // back to RegisterVC
        navigationController?.popViewController(animated: true)
    }
}
