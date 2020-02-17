//
//  MatchingPairsLocalDataSource.swift
//  DataLayer
//
//  Created by Augusto Hurtado on 17/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation

public struct MatchingPairsLocalDataSource: MatchingPairsDataSourceProtocol {
    
    var db : DBHelper = DBHelper()
    
    public init() {}
    
    public func saveScore(nickname: String, score: Int, completion: @escaping (Bool) -> Void) {
        
        do {
            try db.insert(nickname: nickname, score: score)
        } catch {
            completion(false)
            return
        }
        completion(true)
    }
    
    public func getScores(numberOfItems: Int, completion: @escaping (Bool, [Scores]?) -> Void) {
        
        var scores : [Scores]?
        
        do {
            scores = try db.read(numberOfResults: String(numberOfItems))
        } catch {
            completion(false, nil)
            return
        }
        
        completion(true, scores)
    }
}
