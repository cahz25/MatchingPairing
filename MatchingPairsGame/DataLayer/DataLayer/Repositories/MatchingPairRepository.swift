//
//  MatchingPairRepository.swift
//  DataLayer
//
//  Created by Cesar  Hurtado on 23/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation
import CoreLayer

public class MatchingPairRepository: MatchingPairRepositoryProtocol {
    
    var game = [MatchingPairsCard]()
    var selectIndex : Int?
    
    private let localDataSource: MatchingPairsDataSourceProtocol
    private let remoteDataSource: MatchingPairsDataSourceProtocol
    
    public init(localDataSource: MatchingPairsDataSourceProtocol, remoteDataSource: MatchingPairsDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    public func saveGame(cards: [MatchingPairsCard]) {
        game = cards
    }
    
    public func getCard(index: Int) -> MatchingPairsCard? {
        return game[index]
    }
    
    public func getSelectCard() -> (card: MatchingPairsCard?, index: Int?) {
        var selectCard: (card: MatchingPairsCard?, index: Int?) = (card: nil, index: nil)
        if selectIndex != nil {
            selectCard.card = game[selectIndex!]
            selectCard.index = selectIndex
        }
        return selectCard
    }
    
    public func setSelectCard(index: Int) {
        selectIndex = index
    }
    
    public func cleanSelectCard() {
        selectIndex = nil
    }
    
    public func saveScore(user: MatchingPairsUser, completion: @escaping (Bool) -> Void) {
        self.localDataSource.saveScore(nickname: user.nickname, score: user.score) { (isSuccess) in
            completion(isSuccess)
        }
    }
    
    public func getScores(numberOfItems: Int, completion: @escaping (Bool, [MatchingPairsUser]?) -> Void) {
        
        var scoreInMatchingPairsUser = [MatchingPairsUser]()
        self.localDataSource.getScores(numberOfItems: numberOfItems) { (isSuccess, scores) in
            
            if isSuccess, scores != nil {
                for score in scores! {
                    scoreInMatchingPairsUser.append(MatchingPairsUser(nickname: score.nickname, score: score.score))
                }
                completion(true, scoreInMatchingPairsUser)
            } else {
                completion(false, nil)
            }
            
        }
        
    }
    
}
