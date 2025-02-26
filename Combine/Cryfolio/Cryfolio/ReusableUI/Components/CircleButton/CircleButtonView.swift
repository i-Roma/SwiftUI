//
//  CircleButtonView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 09.02.2025.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background {
                Circle()
                    .foregroundColor(Color.theme.background)
            }
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0,y: 0
            )
            .padding()
            
        
    }
}

// MARK: - #Preview

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonView(iconName: "info")
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonView(iconName: "plus").preferredColorScheme(.dark)
}
