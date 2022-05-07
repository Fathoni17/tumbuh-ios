//
//  GoalsVC.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import UIKit

class GoalsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "GoalListItemCell", bundle: nil), forCellReuseIdentifier: "goalListItemCellId")
    }
    
    func setupNavigationBar() {
        // Add and Settings button for Right barButtonItems
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationItem.title = "Goals"
        self.tabBarController?.navigationItem.leftBarButtonItems = []
        self.tabBarController?.navigationItem.rightBarButtonItems = [addButton]
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.hidesBarsOnSwipe = false
    }

    @objc func addTapped() {
        print("AddTapped")
    }
}

extension GoalsVC: UITableViewDelegate {
}

extension GoalsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        GoalRepository.instance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "goalListItemCellId", for: indexPath) as? GoalListItemCell)!
        let goal = GoalRepository.instance.getGoalList()[indexPath.row]
        
        cell.goalName.text = goal.name
        cell.balance.text = amountFormater(amount: Float(goal.balance), short: false)
        cell.imagePlaceHolder.image = UIImage(named: goal.image)
        if goal.goal != nil {
            let percentage = Double(goal.balance) / Double(goal.goal!) * 100
            cell.progressPrecentage.text = String(format: "%.0f", percentage)+"%"
            cell.goalAmount.text = amountFormater(amount: Float(goal.goal!), short: false)
        } else {
            cell.progressPrecentage.text = "--"
            cell.goalAmount.text = "-"
        }
        
        return cell
    }
}
