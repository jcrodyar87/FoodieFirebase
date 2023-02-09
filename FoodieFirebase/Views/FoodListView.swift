//
//  FoodListView.swift
//  FoodieFirebase
//
//  Created by Juan Carlos Rodriguez Yarmas on 1/02/23.
//

import SwiftUI

struct FoodListView: View {
    
    @EnvironmentObject var itemViewModel:ItemViewmModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(foodCategories, id:\.self) {categoryName in
                    Section(categoryName){
                        ForEach(itemViewModel.FoodItems){ foodItem in
                            if foodItem.category == categoryName {
                                HStack {
                                    Text(foodItem.name)
                                    Spacer()
                                    /**Text(String(format:"$%.2f", foodItem.price))**/
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}
