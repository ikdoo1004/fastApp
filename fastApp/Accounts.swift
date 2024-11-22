//
//  Accounts.swift
//  fastApp
//
//  Created by 김익두 on 11/22/24.
//

import UIKit

struct userAccount {
    let userName: String
    let userPassword: String
    let userEmail: String
    let userPhone: String
}

class Accounts {
    // Sample data of registered accounts
    static var users = [
        userAccount(userName: "Ikdoo Kim", userPassword: "password123", userEmail: "ikdoo1004@gmail.com", userPhone: "3013013301")
    ]
}
