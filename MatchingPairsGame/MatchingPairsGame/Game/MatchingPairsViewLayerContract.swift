//
//  ViewPresenterContract.swift
//  MatchingPairsGame
//
//  Created by Cesar  Hurtado on 4/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

protocol MatchingPairsViewInterface: class {
    func showCard(showCardIndex: Int, cardValue: String)
    func hideCard(hideCardIndex: Int)
    func destroyCard(cardIndex: Int)
    func initTimer()
    func finishGame()
}

protocol MatchingPairsPresenterInterface {
    func initGame(numberOfPairs: Int)
    func selectCard(index: Int?)
    func finishGame(score: Int, nickname: String)
}
