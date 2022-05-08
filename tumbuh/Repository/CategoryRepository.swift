//
//  CategoryRepository.swift
//  tumbuh
//
//  Created by Fathoni on 08/05/22.
//

class CategoryRepository {
    private init() {}
    
    static let instance = CategoryRepository()
    
    private var data: [CategoryModel] = [
        CategoryModel(id: "1", name: "Foods", type: .expense),
        CategoryModel(id: "2", name: "Transport", type: .expense),
        CategoryModel(id: "3", name: "Bills", type: .expense),
        CategoryModel(id: "4", name: "Shopping", type: .expense),
        CategoryModel(id: "5", name: "Grocery", type: .expense),
        CategoryModel(id: "6", name: "Fees", type: .expense),
        CategoryModel(id: "7", name: "Lost", type: .expense),
        // MARK: Income categories
        CategoryModel(id: "8", name: "Salary", type: .income),
        CategoryModel(id: "9", name: "Bonus", type: .income),
        CategoryModel(id: "10", name: "Profit", type: .income),
        // MARK: Transfer categories
        CategoryModel(id: "11", name: "Transfer In", type: .income),
        CategoryModel(id: "12", name: "Transfer Out", type: .expense),
        CategoryModel(id: "13", name: "Topup Investment", type: .income),
        CategoryModel(id: "14", name: "Withdrawal", type: .expense)
    ]
    
    var count: Int {
        get {
            return self.data.count
        }
    }
    
    func getCategories() -> [CategoryModel] {
        return self.data
    }
    
    func getCategoriesByType(type: CategoryType) -> [CategoryModel] {
        return self.data.filter { $0.type == type }
    }
    
    func getCategoryById(id: String) -> CategoryModel? {
        return self.data.first { $0.id == id }
    }
}
