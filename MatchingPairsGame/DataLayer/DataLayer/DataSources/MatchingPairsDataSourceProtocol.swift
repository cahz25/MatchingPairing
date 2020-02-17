//
//  MatchingPairsDataSource.swift
//  DataLayer
//
//  Created by Augusto Hurtado on 17/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation

public protocol MatchingPairsDataSourceProtocol {
    func saveScore(nickname: String, score: Int, completion: @escaping (Bool) -> Void)
    func getScores(numberOfItems: Int, completion: @escaping (Bool, [Scores]?) -> Void)
}
