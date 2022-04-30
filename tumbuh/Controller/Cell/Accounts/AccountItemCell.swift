//
//  AccountItemCell.swift
//  tumbuh
//
//  Created by Fathoni on 29/04/22.
//

import UIKit

class AccountItemCell: UITableViewCell {

    @IBOutlet weak var container: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        container.layer.cornerRadius =  8
        container.clipsToBounds = true
    }
    
}
