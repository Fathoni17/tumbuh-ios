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
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        let buttonText = UIButton(type: .custom)
        
        buttonText.setTitle(dateFormatter.string(from: Date.now), for: .normal)
        buttonText.setTitleColor(UIColor(named: "primary"), for: .normal)
        let todayDate = UIBarButtonItem(customView: buttonText)
        
        // Add and Settings button for Right barButtonItems
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingsTapped))
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationItem.title = "Today"
        self.tabBarController?.navigationItem.leftBarButtonItems = [todayDate]
        self.tabBarController?.navigationItem.rightBarButtonItems = [settingsButton, addButton]
        self.tabBarController?.navigationController?.hidesBarsOnSwipe = true
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let draggDelta = scrollView.contentOffset.y - targetContentOffset.pointee.y

        let hiddenContentHeight = tableView.contentSize.height - tableView.frame.height - 1

        if 0 < draggDelta && targetContentOffset.pointee.y < hiddenContentHeight || (targetContentOffset.pointee.y == 0 && scrollView.contentOffset.y < 0) {

            // Shows Navigation Bar
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    @objc func addTapped() {
        print("AddTapped")
    }
    @objc func settingsTapped() {
        print("SettingsTapped")
    }
}

extension SummaryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3+7 // plus number of accounts
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 71+24
        case 1:
            return 152+8+17+24
        case 2:
            return 52
        default:
            return 70+16
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
            
            return cell
        }
        
    }
    
}
