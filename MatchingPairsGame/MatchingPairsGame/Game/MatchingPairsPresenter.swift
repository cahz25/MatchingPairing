//
//  MatchingPairsPresenter.swift
//  MatchingPairsGame
//
//  Created by Cesar  Hurtado on 4/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation
import CoreLayer

class MatchingPairsPresenter {
    
    var view: MatchingPairsViewInterface?
    var generateGameInteractor: InteractorAsync<Int>?
    var analizeSelectCardInteractor: InteractorAsync<Int?>?
    var finishGameInteractor: InteractorAsync<MatchingPairsUser>?
    var numberOfPairsInGame: Int = 0
    var numberOfMatch: Int = 0
    
    var cardsValues = [Int: String]()
    
    private var emojisValues: Array<String> = ["🎃","👻","🐷", "🐤", "🐍", "🦄"]
    
    func getCardValue(showCardIndentifier: Int, arrayOfValues: inout Array<String>) -> String  {
        var cardValue = cardsValues[showCardIndentifier]
        
        if cardValue == nil {
            cardValue = getRandomCardValue(arrayOfValues: &arrayOfValues)
            cardsValues[showCardIndentifier] = cardValue
        }
        
        return cardValue!
    }
    
    func getRandomCardValue(arrayOfValues: inout Array<String>) -> String {
        var valueToReturn = "?"
        let randomIndex = Int(arc4random_uniform(UInt32(arrayOfValues.count)))
        
        if arrayOfValues.count > 0 {
            valueToReturn = arrayOfValues.remove(at: randomIndex)
        }
        return valueToReturn
    }
    
    func selectCardInView(showCardIndex: Int, cardIndentifier: Int, arrayOfValues: inout [String]) {
        let cardValue = getCardValue(showCardIndentifier: cardIndentifier, arrayOfValues: &arrayOfValues)
        view?.showCard(showCardIndex: showCardIndex, cardValue: cardValue)
    }
    
}

extension MatchingPairsPresenter: MatchingPairsPresenterInterface {
    
    func initGame(numberOfPairs: Int) {
        numberOfPairsInGame = numberOfPairs
        generateGameInteractor?.execute(params: numberOfPairs)
        self.view?.initTimer()
    }
    
    func selectCard(index: Int?) {
        analizeSelectCardInteractor?.execute(params: index)
    }
    
    func finishGame(score: Int, nickname: String) {
        let request = MatchingPairsUser(nickname: nickname, score: score)
        finishGameInteractor?.execute(params: request)
    }
    
}

extension MatchingPairsPresenter: MatchingPairsInteractorToPresenterInterface {
    
    func selectCard(showCardIndex: Int, cardIndentifier: Int) {
        selectCardInView(showCardIndex: showCardIndex, cardIndentifier: cardIndentifier, arrayOfValues: &emojisValues)
    }
    
    func matchCards(showCardIndex: Int, lastCardIndex: Int, cardIndentifier: Int) {
        selectCardInView(showCardIndex: showCardIndex, cardIndentifier: cardIndentifier, arrayOfValues: &emojisValues)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view?.destroyCard(cardIndex: showCardIndex)
            self.view?.destroyCard(cardIndex: lastCardIndex)
        }
        numberOfMatch += 1
        if numberOfMatch == numberOfPairsInGame {
            print("Game has finished")
            self.view?.finishGame()
        }
    }
    
    func wrongMatch(hideCardIndex: Int, lastCardIndex: Int, cardIndentifier: Int) {
        selectCardInView(showCardIndex: hideCardIndex, cardIndentifier: cardIndentifier, arrayOfValues: &emojisValues)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view?.hideCard(hideCardIndex: hideCardIndex)
            self.view?.hideCard(hideCardIndex: lastCardIndex)
        }
    }
    
}

extension MatchingPairsPresenter: MatchingPairsFinishInteractorToPresenterInterface{
    
    func goToScoreView() {
        self.view?.goToScore()
    }
}
