//
//  AccountSummaryCell.swift
//  tumbuh
//
//  Created by Fathoni on 29/04/22.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var imagePlaceholder: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imagePlaceholder.layer.cornerRadius = 27
        imagePlaceholder.clipsToBounds = true
    }
}
