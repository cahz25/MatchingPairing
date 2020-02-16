//
//  MatchingPairsUser.swift
//  CoreLayer
//
//  Created by Augusto Hurtado on 16/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation

public struct MatchingPairsUser {
    
    public var nickname : String
    public var score : Int
    
    public init(nickname: String, score: Int) {
        self.nickname = nickname
        self.score = score
    }
}
