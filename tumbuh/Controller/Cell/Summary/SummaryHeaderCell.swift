//
//  SummaryHeaderCell.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import UIKit

class SummaryHeaderCell: UITableViewCell {
    
    @IBOutlet weak var balanceNetWorth: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        balanceNetWorth.text = "Rp 0,-"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
