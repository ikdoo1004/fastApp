//
//  CustomCell.swift
//  fastApp
//
//  Created by 김익두 on 11/19/24.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var songName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
