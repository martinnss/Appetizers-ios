//
//  ContentView.swift
//  Appetizers
//
//  Created by Martin Olivares on 28-06-25.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Order")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
        .accentColor(Color("primaryColor"))
    }
}

#Preview {
    AppetizerTabView()
}
