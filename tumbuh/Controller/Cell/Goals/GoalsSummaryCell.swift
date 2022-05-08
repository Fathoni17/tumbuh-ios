//
//  GoalsSummaryCell.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import UIKit

class GoalsSummaryCell: UITableViewCell {

    @IBOutlet weak var goalCollection: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        registerCell()
    }
    
    func registerCell() {
        goalCollection.register(UINib(nibName: "GoalSummaryItemCell", bundle: nil), forCellWithReuseIdentifier: "goalSummaryItemCellId")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GoalsSummaryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        GoalRepository.instance.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let goal = GoalRepository.instance.getGoalList()[indexPath.row]

        let cell = (goalCollection.dequeueReusableCell(withReuseIdentifier: "goalSummaryItemCellId", for: indexPath) as? GoalSummaryItemCell)!
        cell.goalName.text = goal.name
        cell.thumbGoal.image = UIImage(named: goal.image)
        if (goal.goal != nil) {
            let percentage = Double(goal.balance) / Double(goal.goal!) * 100
            cell.goalPrecentage.text = String(format: "%.0f", percentage)+"%"
            cell.goalProgress.text = "\(amountFormater(amount: CGFloat(goal.balance), short: true)) / \(amountFormater(amount: CGFloat(goal.goal!), short: true))"
        } else {
            cell.goalPrecentage.text = "--"
            cell.goalProgress.text = "\(amountFormater(amount: CGFloat(goal.balance), short: true))"
        }
        addBorder(border: 16, collectionCell: cell)
        
        return cell
    }
    
    
}
