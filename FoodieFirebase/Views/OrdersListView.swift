//
//  OrdersListView.swift
//  FoodieFirebase
//
//  Created by Juan Carlos Rodriguez Yarmas on 1/02/23.
//

import SwiftUI

struct OrdersListView: View {
    @EnvironmentObject var itemViewModel: ItemViewmModel
    
    @State var showCreateOrderView = false
    
    var body: some View {
        NavigationView {
            List {
                if itemViewModel.Orders.count > 0 {
                    ForEach(itemViewModel.Orders) { thisOrder in
                        Section(thisOrder.StudentName) {
                            VStack {
                                ForEach(thisOrder.items, id: \.self) { foodItemName in
                                    if let thisItem = itemViewModel.FoodItems.first(where: {$0.name == foodItemName} ){
                                        Text(thisItem.name)
                                        Spacer()
                                        Text(String(thisItem.price))
                                    } else {
                                        Text("Item not found")
                                    }
                                    
                                }
                            }
                        }
                        
                    }
                } else {
                    // No orders
                    Text("No Orders")
                }
            }
            .navigationTitle("Orders")
        }
    }
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListView()
    }
}
