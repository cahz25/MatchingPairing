//
//  AnalizeSelectCardInteractor.swift
//  CoreLayer
//
//  Created by Augusto Hurtado on 25/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

public protocol MatchingPairsInteractorToPresenterInterface {
    func selectCard(showCardIndex: Int, cardIndentifier: Int)
    func matchCards(showCardIndex: Int, lastCardIndex: Int, cardIndentifier: Int)
    func wrongMatch(hideCardIndex: Int, lastCardIndex: Int, cardIndentifier: Int)
}

public class AnalizeSelectCardInteractor: InteractorAsync<Int?> {
    
    var presenter: MatchingPairsInteractorToPresenterInterface?
    var MatchingPairsRepository: MatchingPairRepositoryProtocol?
    
    public init(presenter: MatchingPairsInteractorToPresenterInterface, repository: MatchingPairRepositoryProtocol) {
        self.presenter = presenter
        self.MatchingPairsRepository = repository
    }
    
    public override func buildUseCase(params selectedIndex: Int?) {
        if selectedIndex != nil {
            
            let infoLastSelectCard = MatchingPairsRepository?.getSelectCard()
            let lastSelectCard = infoLastSelectCard?.card
            let currentCard = MatchingPairsRepository?.getCard(index: selectedIndex!)
            
            if lastSelectCard == nil, currentCard != nil {
                MatchingPairsRepository?.setSelectCard(index: selectedIndex!)
                presenter?.selectCard(
                    showCardIndex: selectedIndex!,
                    cardIndentifier: currentCard!.identifier
                )
            } else {
                if infoLastSelectCard!.index! != selectedIndex! {
                    if currentCard?.identifier == lastSelectCard?.identifier {
                        presenter?.matchCards(
                            showCardIndex: selectedIndex!,
                            lastCardIndex: infoLastSelectCard!.index!,
                            cardIndentifier: currentCard!.identifier
                        )
                        MatchingPairsRepository?.cleanSelectCard()
                    } else {
                        presenter?.wrongMatch(
                            hideCardIndex: selectedIndex!,
                            lastCardIndex: infoLastSelectCard!.index!,
                            cardIndentifier: currentCard!.identifier
                        )
                        MatchingPairsRepository?.cleanSelectCard()
                    }
                }
            }
        }
    }
    
}
