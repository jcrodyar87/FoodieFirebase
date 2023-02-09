//
//  FoodItem.swift
//  FoodieFirebase
//
//  Created by Juan Carlos Rodriguez Yarmas on 1/02/23.
//

import Foundation

struct FoodItem: Identifiable, Codable {
    var id = UUID()
    var category: String
    var name: String
    var price: Double
    var inStock: Bool
    
    enum CodingKeys: String, CodingKey {
        case category, name, price, inStock
    }
    
}

let foodCategories = [
    "Warm Food",
    "Sandwiches",
    "Toasted Sandwiches",
    "Wraps",
    "Salads",
    "Snacks",
    "Frozen Snaks",
    "Fruit",
    "Drinks",
    "Extras",
    "Tuesday Specials",
    "Wednesday Specials",
    "Thursday Specials",
    "Friday Specials"
]
