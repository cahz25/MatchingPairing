//
//  GetScoresInteractor.swift
//  CoreLayer
//
//  Created by Augusto Hurtado on 16/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation

public protocol GetScoreInteractorToPresenterInterface {
    func showScoreList(scores: [MatchingPairsUser]?)
}

public class GetScoresInteractor: InteractorAsync<Int> {
    
    var presenter: GetScoreInteractorToPresenterInterface?
    var MatchingPairsRepository: MatchingPairRepositoryProtocol?
    
    public init(presenter: GetScoreInteractorToPresenterInterface, repository: MatchingPairRepositoryProtocol) {
        self.presenter = presenter
        self.MatchingPairsRepository = repository
    }
    
    public override func buildUseCase(params numberOfItems: Int) {
        MatchingPairsRepository?.getScores(numberOfItems: numberOfItems, completion: { (isSuccess, scores) in
            if isSuccess {
                self.presenter?.showScoreList(scores: scores)
            }
        })
    }
    
}
