//
//  LibraryVC.swift
//  fastApp
//
//  Created by 김익두 on 11/21/24.
//

import UIKit

class LibraryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var xibTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NSLayoutConstraint.activate([
                    xibTableView.topAnchor.constraint(equalTo: view.topAnchor),
                    xibTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    xibTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    xibTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        let nib = UINib(nibName: "xibTableViewCell", bundle: nil)
        xibTableView.register(nib, forCellReuseIdentifier: "xibTableViewCell")
        xibTableView.dataSource = self
        xibTableView.delegate = self
        xibTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "xibTableViewCell", for: indexPath) as? xibTableViewCell else {
            return UITableViewCell()
        }
        
        cell.cellLabel.text = "Row \(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // Adjust based on your design
    }
}
