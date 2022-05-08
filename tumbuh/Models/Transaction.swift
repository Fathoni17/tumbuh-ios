//
//  Transaction.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import Foundation

struct TransactionModel {
    var id: String
    var createdAt: Date
//    var updatedAt: Date
    var amount: Int64
    var desc: String
    var category: CategoryModel
    var goal: GoalModel
    var account: AccountModel
}
