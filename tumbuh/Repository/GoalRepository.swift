//
//  GoalRepository.swift
//  tumbuh
//
//  Created by Fathoni on 08/05/22.
//

class GoalRepository {
    private init() {}
    
    static let instance = GoalRepository()
    
    // TODO: this is data dummy provider
    private var data: [GoalModel] = [
        GoalModel(id: "1", name: "Motorcycle", image: "ic_motor", goal: 40000000, balance: 0),
        GoalModel(id: "2", name: "New iPad", image: "ic_mobile", goal: 15000000, balance: 0),
        GoalModel(id: "3", name: "Monthly Budget", image: "ic_wallet", goal: nil, balance: 0),
    ]
    
    func getGoalList() -> [GoalModel] {
        // TODO: update with core data
        return data
    }
    
    var count: Int {
        get {
            return Int(self.data.count)
        }
    }
    
    func updateBalance(transactionList: [TransactionModel]) {
        self.data = self.data.map { (goal) in
            let updatedBalance =  transactionList.filter { (transaction) in
                transaction.goal.id == goal.id
            }.reduce(0) { $0 + $1.amount }
            return GoalModel(id: goal.id, name: goal.name, image: goal.image, goal: goal.goal, balance: updatedBalance)
        }
    }
    
    func getGoalById(id: String) -> GoalModel? {
        let detail = self.data.first { $0.id == id }
        return detail
    }
}
