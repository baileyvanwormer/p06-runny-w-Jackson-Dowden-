//
//  MilesRanViewModel.swift
//  p06-runny
//
//  Created by Bailey Van Wormer on 3/8/22.
//

import Foundation

class MilesRanViewModel: ObservableObject {
    @Published private(set) var milesRan: Double = 0.0
    
    init() {
        milesRan = MilesRanStore.fetchMiles()
    }
    
    func increment(amount: Double) -> Void {
        milesRan += 0.5
        MilesRanStore.save(miles: milesRan)
    }
    
    func decrement(amount: Double) -> Void {
        if milesRan > 0.0 {
            milesRan -= 0.5
        }
        
        MilesRanStore.save(miles: milesRan)
    }
}
