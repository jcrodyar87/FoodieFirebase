//
//  Order.swift
//  FoodieFirebase
//
//  Created by Juan Carlos Rodriguez Yarmas on 1/02/23.
//

import Foundation

struct Order: Identifiable, Codable {
    var id: String
    var StudentName: String
    var items: [String]
    var totalPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case id, StudentName, items, totalPrice
    }
}
