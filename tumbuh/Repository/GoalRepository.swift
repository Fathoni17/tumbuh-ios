//
//  GoalRepository.swift
//  tumbuh
//
//  Created by Fathoni on 08/05/22.
//

class GoalRepository {
    func getGoalList() -> [GoalModel] {
        return [
            GoalModel(id: "1", name: "Motorcycle", image: "ic_motor", goal: 40000000, balance: 0),
            GoalModel(id: "2", name: "New iPad", image: "ic_mobile", goal: 17000000, balance: 0),
            GoalModel(id: "3", name: "Monthly Budget", image: "ic_wallet", goal: nil, balance: 0),
        ]
    }
    
    func getGoalDetailById(id: String) -> GoalModel {
        let detail = (self.getGoalList().first { $0.id == id })!
        return detail
    }
}
