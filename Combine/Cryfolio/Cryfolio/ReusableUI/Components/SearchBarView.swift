//
//  SearchBarView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 16.02.2025.
//

// Source: https://www.youtube.com/watch?v=p-arH7VO4jk&list=PLwvDm4Vfkdphbc3bgy_LpLRQ9DDfFGcFu&index=12

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or symbol...", text: $searchText)
                .disableAutocorrection(true)
                .foregroundColor(Color.theme.accent)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.theme.accent)
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                }
        }
        .padding()
        .font(.headline)
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.2),
                    radius: 8
                )
        }
        .padding()
    }
}

// MARK: - #Preview

#Preview(traits: .sizeThatFitsLayout) {
    SearchBarView(searchText: .constant(""))
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchBarView(searchText: .constant("")).preferredColorScheme(.dark)
}
