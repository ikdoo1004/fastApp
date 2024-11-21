//
//  xibTableViewCell.swift
//  fastApp
//
//  Created by 김익두 on 11/21/24.
//

import UIKit

class xibTableViewCell: UITableViewCell {
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        // Add the label as a subview
        contentView.addSubview(cellLabel)
        
        // Manually set up constraints for the label
        NSLayoutConstraint.activate([
            // Center the label vertically in the cell
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Position the label horizontally at 70% of the cell's width
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width * 0.7)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Since contentView.frame is available during layout, adjust the constraints dynamically
        let leftOffset = contentView.frame.width * 0.7
        NSLayoutConstraint.activate([
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftOffset)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
