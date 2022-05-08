//
//  AccountRepository.swift
//  tumbuh
//
//  Created by Fathoni on 08/05/22.
//

class AccountRepository {
    private init() {}
    
    static let instance = AccountRepository()
    
    private var data: [AccountModel] = [
        AccountModel(id: "0", name: "Wallet", image: "lg_wallet", balance: 320000),
        AccountModel(id: "1", name: "BCA", image: "lg_bca", balance: 3807122),
        AccountModel(id: "2", name: "CIMB", image: "lg_cimb", balance: 3200730),
        AccountModel(id: "3", name: "Jago", image: "lg_jago", balance: 5000000),
        AccountModel(id: "4", name: "Bibit", image: "lg_bibit", balance: 20604294),
        AccountModel(id: "5", name: "Mansek", image: "lg_mansek", balance: 27383471)
    ]
    
    var count: Int {
        get {
            return self.data.count
        }
    }
    
    func getAccounts() -> [AccountModel] {
        return self.data
    }
    
    func getAccountDetailById(id: String) -> AccountModel? {
        return self.data.first { $0.id == id }
    }
    
    func getTotalBalace() -> Int64 {
        let balance: Int64 = self.data.reduce(0) { $0 + $1.balance }
        return balance
    }
}
