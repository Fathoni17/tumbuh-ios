//
//  File.swift
//  tumbuh
//
//  Created by Fathoni on 29/04/22.
//

import UIKit
import Foundation

func addBorder(border: CGFloat, cell: UITableViewCell) {
    // add border
    cell.layer.cornerRadius = border
    cell.clipsToBounds = true
}

func addBorder(border: CGFloat, collectionCell: UICollectionViewCell) {
    // add border
    collectionCell.layer.cornerRadius = border
    collectionCell.clipsToBounds = true
}

func amountFormater(amount: CGFloat, short: Bool) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "id_ID") // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
    formatter.numberStyle = .currency
    
    var amountStr: String
    if short {
        let sufix: String = amount >= 1000000 ? "jt" : amount >= 1000 ? "rb" : ""
        let level: CGFloat = amount >= 1000000 ? 1000000 : amount >= 1000 ? 1000 : 1
        amountStr =  "Rp"+String(format: "%.01f", CGFloat(amount/level)).replacingOccurrences(of: ".", with: ",")+sufix
    } else {
        let formattedTipAmount = formatter.string(from: amount as NSNumber)
        amountStr = String(formattedTipAmount!)
    }
    
    return amount > 0 ? amountStr : "(\(amountStr))"
}
