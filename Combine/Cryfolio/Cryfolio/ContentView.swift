//
//  ContentView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 09.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Accent Color").foregroundColor(Color.theme.accent)
            Text("Secondary text Color").foregroundColor(Color.theme.secondaryText)
            Text("Red Color").foregroundColor(Color.theme.red)
            Text("Green Color").foregroundColor(Color.theme.green)
        }
        .font(.headline)
        .padding()
    }
}

#Preview {
    ContentView()
}
