//
//  AddTransactionVC.swift
//  tumbuh
//
//  Created by Fathoni on 08/05/22.
//

import UIKit

class AddTransactionVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let labels = [
        ["Date", "Amount", "Notes", "Category"],
        ["Goal", "Account"]
    ]
    let listOptions = [
        [ [], [], [], CategoryRepository.instance.getCategories()],
        [ GoalRepository.instance.getGoalList(), AccountRepository.instance.getAccounts()]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "AddTransactionCell", bundle: nil), forCellReuseIdentifier: "inputTransactionCellID")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    @IBAction func cancleTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        let createdAt: Date = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddTransactionCell)!.datePicker.date
        var amount: Int64 = ((tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? AddTransactionCell)!.transactionDetailField.text! as NSString) .longLongValue
        let notes: String = (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? AddTransactionCell)!.transactionDetailField.text!
        let categoryIndex = (tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? AddTransactionCell)!.pickerView.selectedRow(inComponent: 0)
        let category: CategoryModel = CategoryRepository.instance.getCategories()[categoryIndex]
        amount = category.type == .expense ? -1 * amount : amount
        
        let goalIndex = (tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? AddTransactionCell)!.pickerView.selectedRow(inComponent: 0)
        let goal: GoalModel = GoalRepository.instance.getGoalList()[goalIndex]
        
        let accountIndex = (tableView.cellForRow(at: IndexPath(row: 1, section: 1)) as? AddTransactionCell)!.pickerView.selectedRow(inComponent: 0)
        let account: AccountModel = AccountRepository.instance.getAccounts()[accountIndex]
        
        TransactionRepository.instance.addTransaction(goal: goal, account: account, amount: amount, notes: notes, category: category, date: createdAt)

        self.dismiss(animated: true, completion: nil)
    }
    
}

extension AddTransactionVC: UITableViewDelegate {}

extension AddTransactionVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.labels.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Transaction Detail" : "Goal Setting"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        22 + 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.labels[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "inputTransactionCellID", for: indexPath) as? AddTransactionCell)!
        
        cell.title.text = labels[indexPath.section][indexPath.row]
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.transactionInputType = .date
            } else if indexPath.row == 1 || indexPath.row == 2{
                cell.transactionInputType = .amount
            } else {
                cell.listOptionType = .category
            }
        } else {
            if indexPath.row == 0 {
                cell.listOptionType = .goal
            } else {
                cell.listOptionType = .account
            }
        }
        
        cell.listOption = listOptions[indexPath.section][indexPath.row] as! [Any]
        
        
        return cell
    }
}
