//
//  Category.swift
//  tumbuh
//
//  Created by Fathoni on 28/04/22.
//

import Foundation

enum CategoryType {
    case IN, OUT
}

struct CategoryModel {
    var id: String
    var name: String
    var type: CategoryType
}
