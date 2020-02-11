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
    func saveScore(score: Int, nickname: String, completion: @escaping (_ result: Bool?) -> Void)
}
