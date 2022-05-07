//
//  GoalListItemCell.swift
//  tumbuh
//
//  Created by Fathoni on 06/05/22.
//

import UIKit

class GoalListItemCell: UITableViewCell {
    @IBOutlet weak var container: UIStackView!
    @IBOutlet weak var imagePlaceHolder: UIImageView!
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var progressPrecentage: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var goalAmount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        container.layer.cornerRadius =  8
        container.clipsToBounds = true
        imagePlaceHolder.layer.cornerRadius = 8
        imagePlaceHolder.clipsToBounds = true
    }
}
