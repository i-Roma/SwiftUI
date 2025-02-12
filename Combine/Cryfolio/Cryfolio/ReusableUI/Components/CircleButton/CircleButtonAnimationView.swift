//
//  CircleButtonAnimationView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 09.02.2025.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool

    var body: some View {
        
        Circle()
            .stroke(lineWidth: 4)
            .scale(animate ? /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/ : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
    }
}

// MARK: - #Preview

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonAnimationView(animate: .constant(false))
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonAnimationView(animate: .constant(false)).preferredColorScheme(.dark)
}
