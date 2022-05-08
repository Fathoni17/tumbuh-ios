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
        GoalModel(id: "1", name: "Motorcycle", image: "ic_motor", goal: 40000000, balance: 28850000),
        GoalModel(id: "2", name: "New iPad", image: "ic_mobile", goal: 15000000, balance: 8700000),
        GoalModel(id: "3", name: "Hajj", image: "ic_wishlist", goal: 70000000, balance: 17400000),
        GoalModel(id: "4", name: "Monthly Budget", image: "ic_wallet", goal: nil, balance: 5413917),
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
    
    func getGoalById(id: String) -> GoalModel? {
        let detail = self.data.first { $0.id == id }
        return detail
    }
}
