//
//  CustomTabBarController.swift
//  fastApp
//
//  Created by 김익두 on 11/13/24.
//

import UIKit

class CustomTabBarController: UITabBarController {
    @IBInspectable var initialIndex: Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = initialIndex
    }
    
}
