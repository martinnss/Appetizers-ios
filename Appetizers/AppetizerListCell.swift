//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Martin Olivares on 29-06-25.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack {
            Image("asian-flank-stake")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(appetizer.description)
                    .font(.caption)
                Text("$\(appetizer.price,specifier:"%.2f" )")
                    .foregroundStyle(.secondary)
                    .fontWeight(.bold)
                    
            }
            .padding()
            
        }    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
