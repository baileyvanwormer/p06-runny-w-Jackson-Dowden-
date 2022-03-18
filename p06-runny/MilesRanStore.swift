//
//  MilesRanStore.swift
//  p06-runny
//
//  Created by Bailey Van Wormer on 3/8/22.
//

import Foundation
import WidgetKit

struct MilesRanStore {
    
    static func save(miles: Double) {
        defaults.standard.set(miles, forKey: "miles")
    }
    
    static func fetchMiles() -> Double {
        let miles = defaults.standard.double(forKey: "miles")
        return miles
    }
    
    static private var defaults = UserDefaults(suiteName: BaileyVanWormer)!
    
    WidgetCenter.shared.reloadAllTimelines()
    
}
