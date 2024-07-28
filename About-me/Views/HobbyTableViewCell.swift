//
//  HobbyTableViewCell.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 29/7/24.
//

import UIKit

class HobbyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    static let identifier = "HobbyInfoCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HobbyTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func binding(data hobby: Hobby) {
        titleLabel.text = hobby.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
