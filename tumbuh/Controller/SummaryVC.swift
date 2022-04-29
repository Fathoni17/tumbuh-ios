//
//  SummaryVC.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import UIKit

class SummaryVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        tableView.separatorStyle = .none
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "SummaryHeaderCell", bundle: nil), forCellReuseIdentifier: "summaryHeaderCellId")
        tableView.register(UINib(nibName: "GoalsSummaryCell", bundle: nil), forCellReuseIdentifier: "goalsSummaryCellId")
        tableView.register(UINib(nibName: "AccountHeaderSummaryCell", bundle: nil), forCellReuseIdentifier: "accountHeaderSummaryCellId")
        tableView.register(UINib(nibName: "AccountItemCell", bundle: nil), forCellReuseIdentifier: "accountItemCellId")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationItem.title = "Today"
    }
}

extension SummaryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 71+24
        case 1:
            return 152+8+17+16
        case 2:
            return 52
        default:
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "summaryHeaderCellId", for: indexPath) as? SummaryHeaderCell)!
            cell.balanceNetWorth.text = amountFormater(amount: 2050000, short: true)
            return cell
        case 1:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "goalsSummaryCellId", for: indexPath) as? GoalsSummaryCell)!
            
            return cell
        case 2:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "accountHeaderSummaryCellId", for: indexPath) as? AccountHeaderSummaryCell)!
            
            return cell
        default:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "accountItemCellId", for: indexPath) as? AccountItemCell)!

            addBorder(border: 12, cell: cell)
            
            return cell
        }
        
    }
    
}
