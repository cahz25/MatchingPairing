//
//  MatchingPairGameRepositoryProtocol.swift
//  CoreLayer
//
//  Created by Cesar  Hurtado on 23/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

public protocol MatchingPairRepositoryProtocol {
    func saveGame(cards: [MatchingPairsCard])
    func getCard(index: Int) -> MatchingPairsCard?
    func getSelectCard() -> (card: MatchingPairsCard?, index: Int?)
    func setSelectCard(index: Int)
    func cleanSelectCard()
    func saveScore(user: MatchingPairsUser, completion: @escaping (_ isSuccess: Bool) -> Void)
    func getScores(numberOfItems: Int, completion: @escaping (_ isSuccess: Bool, _ scores: [MatchingPairsUser]?) -> Void)
}
