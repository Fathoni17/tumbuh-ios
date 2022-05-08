//
//  AddTransactionVC.swift
//  tumbuh
//
//  Created by Fathoni on 08/05/22.
//

import UIKit

class AddTransactionVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancleTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
