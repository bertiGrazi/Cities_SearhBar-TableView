//
//  Cities.swift
//  TableView_SearchBar
//
//  Created by Grazi Berti on 17/10/20.
//

import Foundation
protocol SearchProtocol {
    func getTeam() -> String
}

class Cities {
    var city: String
    var states: String
    var country: String
    
    init(city: String, states: String, country: String) {
        self.city = city
        self.states = states
        self.country = country
    }
}

extension Cities: SearchProtocol {
    func getTeam() -> String{
        return "\(city) \(states) \(country)".lowercased()
    }
}
