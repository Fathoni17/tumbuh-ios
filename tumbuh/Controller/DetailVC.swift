//
//  DetailVC.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }

    func registerCell() {
        tableView.register(UINib(nibName: "DetailItemCell", bundle: nil), forCellReuseIdentifier: "detailItemCellId")
    }
    
    func setupNavigationBar() {
        // Add and Settings button for Right barButtonItems
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationItem.title = "Detail Transaction"
        self.tabBarController?.navigationItem.leftBarButtonItems = []
        self.tabBarController?.navigationItem.rightBarButtonItems = [addButton]
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.hidesBarsOnSwipe = false
    }

    @objc func addTapped() {
        print("AddTapped")
    }
}

extension DetailVC: UITableViewDelegate {
}

extension DetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        22 + 16
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group on \(section)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TransactionRepository.instance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "detailItemCellId", for: indexPath) as? DetailItemCell)!
        
        let transaction = TransactionRepository.instance.getTransactionList()[indexPath.row]
        
        cell.title.text = transaction.desc
        cell.subtitle.text = transaction.category.name + " " + transaction.createdAt.ISO8601Format()
        // TODO: Change source from repo
        let amountTransaction = transaction.amount
        cell.detailLabel.text = amountFormater(amount: CGFloat(amountTransaction), short: false)
        
        if amountTransaction > 0 {
            cell.detailLabel.textColor = UIColor(named: "primary")
        } else {
            cell.detailLabel.textColor = UIColor(named: "error")
        }
        
        return cell
    }
    
    
}
