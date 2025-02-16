//
//  HomeStatistisView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 16.02.2025.
//

import SwiftUI

struct HomeStatistisView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistis) { stat in
                StatisticView(model: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(
            width: UIScreen.main.bounds.width,
            alignment: showPortfolio ? .trailing : .leading
        )
    }
}

// MARK: - #Preview

#Preview(traits: .sizeThatFitsLayout) {
    HomeStatistisView(showPortfolio: .constant(false))
        .environmentObject(HomeViewModel.dummy)
}

#Preview(traits: .sizeThatFitsLayout) {
    HomeStatistisView(showPortfolio: .constant(false))
        .environmentObject(HomeViewModel.dummy)
        .preferredColorScheme(.dark)
}
