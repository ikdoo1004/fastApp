//
//  downloadsVC.swift
//  fastApp
//
//  Created by 김익두 on 11/13/24.
//

import UIKit

class DownloadVC : UIViewController {
    
    @IBOutlet weak var downloadTabItem: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        downloadTabItem.badgeValue = nil
    }
}
