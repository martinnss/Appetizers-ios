//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Martin Olivares on 28-06-25.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle(Text("🍔Appetizers"))
        }
    }
}

#Preview {
    AppetizerListView()
}
