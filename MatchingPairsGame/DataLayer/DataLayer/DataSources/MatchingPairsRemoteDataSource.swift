//
//  MatchingPairsRemoteDataSource.swift
//  DataLayer
//
//  Created by Augusto Hurtado on 17/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation

public struct MatchingPairsRemoteDataSource: MatchingPairsDataSourceProtocol {
    
    public init() {}
    
    public func saveScore(nickname: String, score: Int, completion: @escaping (Bool) -> Void) {
        //TODO: go to server to save data
    }
    
    public func getScores(numberOfItems: Int, completion: @escaping (Bool, [Scores]?) -> Void) {
        //TODO: go to server to get data
    }
    
}
