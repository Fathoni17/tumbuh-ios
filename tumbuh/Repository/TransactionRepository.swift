//
//  TransactionRepository.swift
//  tumbuh
//
//  Created by Fathoni on 08/05/22.
//
import Foundation

class TransactionRepository {
    private let dateFormatter = DateFormatter()
    
    private init() {
        ctgRepo = CategoryRepository.instance
        goalRepo = GoalRepository.instance
        accRepo = AccountRepository.instance
        dateFormatter.dateFormat = "yyyy-MM-dd"
    data = [
        TransactionModel(
            id: "0",
            createdAt: self.dateFormatter.date(from: "2022-01-01")!,
            amount: 4913000,
            desc: "Modal Awal",
            category: ctgRepo.getCategoryById(id: "11")!,
            goal: goalRepo.getGoalById(id: "4")!,
            account: accRepo.getAccountDetailById(id: "1")!),
        TransactionModel(
            id: "1",
            createdAt: self.dateFormatter.date(from: "2022-01-01")!,
            amount: 130000,
            desc: "Cash Awal",
            category: ctgRepo.getCategoryById(id: "11")!,
            goal: goalRepo.getGoalById(id: "4")!,
            account: accRepo.getAccountDetailById(id: "0")!),
        TransactionModel(
            id: "2",
            createdAt: randomDate() ?? Date.now,
            amount: -65000,
            desc: "Shampoo and Parfume",
            category: ctgRepo.getCategoryById(id: "5")!,
            goal: goalRepo.getGoalById(id: "4")!,
            account: accRepo.getAccountDetailById(id: "1")!),
        TransactionModel(
            id: "3",
            createdAt: randomDate() ?? Date.now,
            amount: -250000,
            desc: "Gasoline",
            category: ctgRepo.getCategoryById(id: "2")!,
            goal: goalRepo.getGoalById(id: "4")!,
            account: accRepo.getAccountDetailById(id: "1")!),
        TransactionModel(
            id: "4",
            createdAt: randomDate() ?? Date.now,
            amount: -50000,
            desc: "Internet Data",
            category: ctgRepo.getCategoryById(id: "3")!,
            goal: goalRepo.getGoalById(id: "4")!,
            account: accRepo.getAccountDetailById(id: "0")!),
        ]
    }
    
    static let instance = TransactionRepository()
    
    private var ctgRepo: CategoryRepository
    private var goalRepo: GoalRepository
    private var accRepo: AccountRepository
    
    private var data: [TransactionModel]
    
    var count: Int {
        get {
            return self.data.count
        }
    }
    
    func getTransactionList() -> [TransactionModel] {
        return self.data
    }
    
    func syncBalance() {
        self.goalRepo.updateBalance(transactionList: self.data)
        self.accRepo.updateBalance(transactionList: self.data)
    }
    
    func addTransaction(goal: GoalModel, account: AccountModel, amount: Int64, notes: String, category: CategoryModel, date: Date) -> TransactionModel {
        let lastIndex = Int(self.data.last!.id)!
        let newTransaction = TransactionModel(id: "\(lastIndex + 1)", createdAt: date, amount: amount, desc: notes, category: category, goal: goal, account: account)
        self.data.append(newTransaction)
        self.syncBalance()
        
        return newTransaction
    }
}


func randomDate() -> Date? {
    let date = Date()
    let calendar = Calendar.current
    var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    guard
        let days = calendar.range(of: .month, in: .year, for: date),
        let randomDay = days.randomElement()
    else {
            return nil
    }
    dateComponents.setValue(randomDay, for: .month)
    return calendar.date(from: dateComponents)
}
