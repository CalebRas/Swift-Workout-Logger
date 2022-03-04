//
//  Reps.swift
//  Workout Logger
//
//  Created by Caleb Ras on 2/24/22.
//

import Foundation


// Struct containing an exercise name with days of set weights
struct Exercise {
    
    let name: String
    var days: Array<Array<Int>>
    
    init (name: String) {
        
        self.name = name
        self.days = [[0, 0, 0]]
        
    }   // init
    
    
}   // Exercise

