//
//  Transaction.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import Foundation

struct TransactionModel {
    var id: String
    var type: Int
    var amount: Int64
    var createdAt: Date
//    var updatedAt: Date
    var category: CategoryModel
    var goal: GoalModel
    var account: AccountModel
}
