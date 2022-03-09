//
//  MilesRanStore.swift
//  p06-runny
//
//  Created by Bailey Van Wormer on 3/8/22.
//

import Foundation

struct MilesRanStore {
    
    static func save(miles: Double) {
        UserDefaults.standard.set(miles, forKey: "miles")
    }
    
    static func fetchMiles() -> Double {
        let miles = UserDefaults.standard.double(forKey: "miles")
        return miles
    }
    
}
