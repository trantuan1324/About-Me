//
//  FamilyTableViewCell.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 28/7/24.
//

import UIKit

class FamilyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memberImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var hobiesLabel: UILabel!
    
    static let identifier = "MemberInfoCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FamilyTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
