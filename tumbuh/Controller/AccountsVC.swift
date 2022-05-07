//
//  ViewController.swift
//  tumbuh
//
//  Created by Fathoni on 27/04/22.
//

import UIKit

class AccountVC: UIViewController {
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
        tableView.register(UINib(nibName: "AccountItemCell", bundle: nil), forCellReuseIdentifier: "accountItemCellId")
    }
    
    func setupNavigationBar() {
        // Add and Settings button for Right barButtonItems
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationItem.title = "Accounts"
        self.tabBarController?.navigationItem.leftBarButtonItems = []
        self.tabBarController?.navigationItem.rightBarButtonItems = [addButton]
        self.tabBarController?.navigationController?.hidesBarsOnSwipe = false
    }
    
    @objc func addTapped() {
        print("AddTapped")
    }
}

extension AccountVC: UITableViewDelegate {
}

extension AccountVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "accountItemCellId", for: indexPath) as? AccountItemCell)!
        
        return cell
    }
}
