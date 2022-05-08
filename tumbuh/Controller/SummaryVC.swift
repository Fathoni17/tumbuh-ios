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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    func registerCell() {
        // MARK: - Registering used cell
        tableView.register(UINib(nibName: "SummaryHeaderCell", bundle: nil), forCellReuseIdentifier: "summaryHeaderCellId")
        tableView.register(UINib(nibName: "GoalsSummaryCell", bundle: nil), forCellReuseIdentifier: "goalsSummaryCellId")
        tableView.register(UINib(nibName: "AccountSummaryCell", bundle: nil), forCellReuseIdentifier: "accountSummaryCellId")
    }

    func setupNavigationBar() {
        // MARK: - setup Navigation Bar
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM"
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
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.navigationController?.hidesBarsOnSwipe = true
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // MARK: - Handle navigation to show on scroll down
        let draggDelta = scrollView.contentOffset.y - targetContentOffset.pointee.y

        let hiddenContentHeight = tableView.contentSize.height - tableView.frame.height - 1

        if 0 < draggDelta && targetContentOffset.pointee.y < hiddenContentHeight || (targetContentOffset.pointee.y == 0 && scrollView.contentOffset.y < 0) {

            // Shows Navigation Bar
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    // MARK: - Function for button
    @objc func addTapped() {
        print("AddTapped")
        performSegue(withIdentifier: "addTransactionSummaryMd", sender: self)
    }
    @objc func settingsTapped() {
        print("SettingsTapped")
    }
    
    // MARK: - Navigation Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTransactionSummaryMd" {
            let dest = segue.destination as! AddTransactionVC
            dest.delegate = self
        }
    }
}

extension SummaryVC: AddTransactionDelegate {
    func addTransaction(transaction: TransactionModel) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SummaryVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return AccountRepository.instance.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16 + 22 + 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 37
        case 1:
            return 152
        default:
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var titleStr: String?
        switch section {
        case 0:
            titleStr = "You have saved"
        case 1:
            titleStr = "My goals"
        case 2:
            titleStr = "My accounts"
        default:
            titleStr = nil
        }

        let vw = UIView()
        vw.backgroundColor = UIColor(named: "background")

        let headerLabel = UILabel()
        headerLabel.text = titleStr
        headerLabel.font = .systemFont(ofSize: 17, weight: .medium)
        headerLabel.textColor = .secondaryLabel
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        vw.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: vw.topAnchor, constant: 16),
            vw.bottomAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8),
            vw.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            vw.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor)
        ])

        return titleStr == nil ? nil : vw
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "summaryHeaderCellId", for: indexPath) as? SummaryHeaderCell)!
            
            // Total Balace from current account list state
            let totalBalace = AccountRepository.instance.getTotalBalace()
            
            cell.balanceNetWorth.text = amountFormater(amount: CGFloat(Double(totalBalace)/1.0), short: false)
            return cell
        case 1:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "goalsSummaryCellId", for: indexPath) as? GoalsSummaryCell)!
                        
            return cell
        default:
            let account = AccountRepository.instance.getAccounts()[indexPath.row]
            let cell = (tableView.dequeueReusableCell(withIdentifier: "accountSummaryCellId", for: indexPath) as? AccountSummaryCell)!
            
            cell.accountName.text = account.name
            cell.accountBalance.text = amountFormater(amount: CGFloat(account.balance), short: false)
            cell.imagePlaceholder.image = UIImage(named: account.image)
            
            return cell
        }
        
    }
    
}
