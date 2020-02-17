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
    var db : DBHelper = DBHelper()
    
    public init() {}
    
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
        do {
            try db.insert(nickname: user.nickname, score: user.score)
        } catch {
            completion(false)
            return
        }
        completion(true)
    }
    
    public func getScores(numberOfItems: Int, completion: @escaping (Bool, [MatchingPairsUser]?) -> Void) {
        var scores : [Scores]?
        var scoreInMatchingPairsUser = [MatchingPairsUser]()
        do {
            scores = try db.read(numberOfResults: String(numberOfItems))
        } catch {
            completion(false, nil)
            return
        }
        
        for score in scores! {
            scoreInMatchingPairsUser.append(MatchingPairsUser(nickname: score.nickname, score: score.score))
        }
        
        completion(true, scoreInMatchingPairsUser)
    }
    
}
