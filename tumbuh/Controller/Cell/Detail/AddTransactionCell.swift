//
//  AddTransactionCell.swift
//  tumbuh
//
//  Created by Fathoni on 08/05/22.
//

import UIKit

enum TransactionInputType {
    case date, picker, amount
}

enum ListType {
    case category, goal, account
}

struct OptionListType<OptionStruct> {
    var data: [OptionStruct]
}

class AddTransactionCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var transactionDetailField: UITextField!
    var transactionInputType: TransactionInputType = .picker
    var listOptionType: ListType = .account
    var listOption = [Any]()
    
    // MARK: Local variable/constant
    let datePicker = UIDatePicker()
    let pickerView = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Initialization code
        switch self.transactionInputType {
        case .date:
            createDatepicker()
            transactionDetailField.tintColor = .clear
            transactionDetailField.placeholder = "Set Date"
            break
        case .picker:
            createListPicker()
            transactionDetailField.tintColor = .clear
            transactionDetailField.placeholder = "Select \(self.title.text!)"
        default:
            transactionDetailField.tintColor = UIColor(named: "primary")
            transactionDetailField.placeholder = "Input \(self.title.text!)"
            break
        }
        transactionDetailField.textColor = UIColor(named: "primary")
    }

    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: self.transactionInputType == .date ? #selector(onDatepickerDonePressed) : #selector(onPickerDonePressed))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
        
    func createDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .systemBackground
        transactionDetailField.inputView = datePicker
        transactionDetailField.inputAccessoryView = createToolbar()
    }
    
    @objc func onDatepickerDonePressed(sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        
        self.transactionDetailField.text = dateFormatter.string(from: datePicker.date)
        self.transactionDetailField.endEditing(true)
    }
    
    @objc func onPickerDonePressed(sender: Any) {
        self.transactionDetailField.text = "??"
        self.transactionDetailField.endEditing(true)
    }
    
    func createListPicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .systemBackground
        transactionDetailField.inputView = pickerView
    }
}

extension AddTransactionCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.listOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        getLabel(data: listOption[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.transactionDetailField.text = getLabel(data: listOption[row])
        self.transactionDetailField.resignFirstResponder()
    }
    
    func getLabel(data: Any) -> String {
        switch listOptionType {
        case .category:
            return (data as? CategoryModel)!.name
        case .goal:
            return (data as? GoalModel)!.name
        case .account:
            return (data as? AccountModel)!.name
        }
    }
}
