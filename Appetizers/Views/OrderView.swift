//
//  OrderView.swift
//  Appetizers
//
//  Created by Martin Olivares on 28-06-25.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView {
            Text("Order view")
                .navigationTitle(Text("🛒Orders"))
        }
    }
}

#Preview {
    OrderView()
}
