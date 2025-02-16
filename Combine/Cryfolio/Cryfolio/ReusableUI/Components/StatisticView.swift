//
//  StatisticView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 16.02.2025.
//

import SwiftUI

struct StatisticView: View {
    
    let model: StatisticModel
    
    private var prcntg: Double {
        model.percentageChange ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            
            Text(model.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack {
                if prcntg != 0 {
                    Image(systemName: "triangle.fill")
                        .font(.caption2)
                        .rotationEffect(
                            Angle(degrees: prcntg > 0 ? 0 : 180)
                        )
                    
                    Text(model.percentageChange?.asPercentString ?? "")
                        .font(.caption)
                        .bold()
                }
            }
            .foregroundColor(
                prcntg > 0 ? Color.theme.green : Color.theme.red
            )
        }
    }
}

// MARK: - #Preview

#Preview(traits: .sizeThatFitsLayout) {
    StatisticView(model: .stat1)
}

#Preview(traits: .sizeThatFitsLayout) {
    StatisticView(model: .stat2)
}

#Preview(traits: .sizeThatFitsLayout) {
    StatisticView(model: .stat3)
}

#Preview(traits: .sizeThatFitsLayout) {
    StatisticView(model: .stat1).preferredColorScheme(.dark)
}

#Preview(traits: .sizeThatFitsLayout) {
    StatisticView(model: .stat2).preferredColorScheme(.dark)
}

#Preview(traits: .sizeThatFitsLayout) {
    StatisticView(model: .stat3).preferredColorScheme(.dark)
}
