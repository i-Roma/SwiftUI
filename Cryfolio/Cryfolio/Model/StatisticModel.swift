//
//  Color.swift
//  Cryfolio
//
//  Created by Roman Romanenko on 09.02.2025.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}

// MARK: - DummyData

extension StatisticModel {
    
    static var stat1: StatisticModel {
        StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    }
    
    static var stat2: StatisticModel {
        StatisticModel(title: "Total Volume", value: "$1.23Tr")
    }
    
    static var stat3: StatisticModel {
        StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
    }
}
