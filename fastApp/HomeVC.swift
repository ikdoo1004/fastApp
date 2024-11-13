//
//  HomeVC.swift
//  fastApp
//
//  Created by 김익두 on 11/13/24.
//

import UIKit

class HomeVC : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newDownloadAction(_ sender: Any) {
        let tabBar = self.tabBarController!.tabBar
        let downloadItem = tabBar.items![0]
        downloadItem.badgeColor = UIColor.red
        downloadItem.badgeValue = "1"
    }
    
}
