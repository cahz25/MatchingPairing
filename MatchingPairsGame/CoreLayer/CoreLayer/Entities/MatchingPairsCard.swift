//
//  MatchingPairsCard.swift
//  CoreLayer
//
//  Created by Cesar  Hurtado on 23/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

public struct MatchingPairsCard {
    
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = MatchingPairsCard.getUniqueIdentifier()
    }
}
