//
//  ContentView.swift
//  FoodieFirebase
//
//  Created by Juan Carlos Rodriguez Yarmas on 1/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FoodListView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrdersListView()
                .tabItem {
                    Label("Orders", systemImage: "bag")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
