//
//  HomeViewHeader.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 09.02.2025.
//

import SwiftUI

struct HomeViewHeader: View {
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background {
                    CircleButtonAnimationView(animate: $showPortfolio)
                }
            Spacer()
            
            Text(showPortfolio ? "Portflolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color.theme.accent)
            
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

// MARK: - #Preview

#Preview(traits: .sizeThatFitsLayout) {
    HomeViewHeader(showPortfolio: .constant(false))
}

#Preview(traits: .sizeThatFitsLayout) {
    HomeViewHeader(showPortfolio: .constant(false)).preferredColorScheme(.dark)
}
