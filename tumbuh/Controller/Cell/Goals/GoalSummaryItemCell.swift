//
//  GoalSummaryItemCell.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import UIKit

class GoalSummaryItemCell: UICollectionViewCell {

    @IBOutlet weak var goalPrecentage: UILabel!
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    @IBOutlet weak var thumbGoal: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        thumbGoal.layer.cornerRadius = 8
        thumbGoal.clipsToBounds = true
    }

}
