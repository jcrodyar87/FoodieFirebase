//
//  ItemViewModel.swift
//  FoodieFirebase
//
//  Created by Juan Carlos Rodriguez Yarmas on 1/02/23.
//

import Foundation
import Combine
import FirebaseFirestore
import Firebase

class ItemViewmModel: ObservableObject {
    
    init() {
        getFood()
        getOrders()
    }
    
    @Published var FoodItems = [FoodItem]()
    
    func getFood(){
        // Get a reference to the database
        let db = Firestore.firestore()
        // Read the document at a specific path
        db.collection("FoodItems").getDocuments{ snapShot, error in
            if error == nil {
                // no errors
                // Update the list property in the main thread
                DispatchQueue.main.async {
                    self.FoodItems = snapShot!.documents.map { d in
                        return FoodItem(
                            category: d["Category"] as? String ?? "Other",
                            name: d["Name"] as? String ?? "Item Failed to Load",
                            price: Double(d["Price"] as? String ?? "0.00")!,
                            inStock: Bool(d["InStock"] as? String ?? "false")!)
                    }
                }
            } else {
              // hanlde the error
            }
        }
        
    }
    
    @Published var Orders = [Order]()
    
    func getOrders() {
        // Get a reference to the database
        let db = Firestore.firestore()
        // Read the document at a specific path
        db.collection("Orders").getDocuments{ snapShot, error in
            if error == nil {
                // no errors
                // Update the list property in the main thread
                DispatchQueue.main.async {
                    self.Orders = snapShot!.documents.map { d in
                        return Order(
                            id: d.documentID,
                            StudentName: d["StudentName"] as? String ?? "No Name",
                            items: d["itens"] as? [String] ?? [String](),
                            totalPrice: Double(d["TotalPrice"] as? String ?? "0.00")!)
                    }
                }
            } else {
              // hanlde the error
            }
        }
    }
    
    func addOrder(StudentName: String, items: [String], totalPrice: Double){
        // Get a reference to the database
        let db = Firestore.firestore()
        // Add a document to the collection
        db.collection("Orders").addDocument(data: [
            "StudentName": StudentName,
            "items": items,
            "totalPrice": totalPrice
        ]){ error in
            if error == nil {
                self.getOrders()
            } else {
                // handle the error
            }
        }
    }
    
    func deleteOrder(_ orderToDelete: Order) {
        // Get a reference to the database
        let db = Firestore.firestore()
        // Specify the document to delete
        db.collection("Orders").document(orderToDelete.id).delete { error in
            if error == nil {
                // no errors
                DispatchQueue.main.async {
                    self.Orders.removeAll { order in
                        // Check for the order to delete
                        return order.id == orderToDelete.id
                    }
                }
            }
        }
    }
}
