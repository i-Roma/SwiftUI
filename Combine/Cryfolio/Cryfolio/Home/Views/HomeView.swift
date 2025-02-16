//
//  HomeView.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 09.02.2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showPortfolio = false
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                HomeViewHeader(showPortfolio: $showPortfolio)
                HomeStatistisView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                ColumnTitles
                
                if !showPortfolio {
                    AllCoinsList.transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    PortfoloiCoinsList.transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

// MARK: - Extension

extension HomeView {
    
    private var ColumnTitles: some View {
        HStack {
            Text("Coins")
            Spacer()
            if showPortfolio { Text("Holdings") }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.4, alignment: .trailing)
        }
        .padding(.horizontal)
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText )
    }
    
    private var AllCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColoum: false)
                    .listRowInsets(
                        .init(
                            top: 10,
                            leading: 0,
                            bottom: 10,
                            trailing: 10
                        )
                    )
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var PortfoloiCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColoum: true)
                    .listRowInsets(
                        .init(
                            top: 10,
                            leading: 0,
                            bottom: 10,
                            trailing: 10
                        )
                    )
            }
        }
        .listStyle(PlainListStyle())
    }
}

// MARK: - #Preview

#Preview {
    NavigationView {
        HomeView().navigationBarHidden(true)
    }
    .environmentObject(HomeViewModel.dummy)
}

#Preview {
    NavigationView {
        HomeView().navigationBarHidden(true).preferredColorScheme(.dark)
    }
    .environmentObject(HomeViewModel.dummy)
}
