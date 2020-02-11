//
//  GenerateGameInteractor.swift
//  CoreLayer
//
//  Created by Augusto Hurtado on 25/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

public class GenerateGameInteractor: InteractorAsync<Int> {
    
    var MatchingPairsRepository: MatchingPairRepositoryProtocol?
    
    public init(repository: MatchingPairRepositoryProtocol) {
        self.MatchingPairsRepository = repository
    }
    
    public override func buildUseCase(params numberOfPairs: Int) {
        var gameCards = [MatchingPairsCard]()
        for _ in 1...numberOfPairs {
            let card = MatchingPairsCard()
            gameCards += [card, card]
        }
        gameCards.shuffle()
        MatchingPairsRepository?.saveGame(cards: gameCards)
    }
    
}


