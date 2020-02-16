//
//  FinishGameInteractor.swift
//  CoreLayer
//
//  Created by Cesar  Hurtado on 9/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation

public protocol MatchingPairsFinishInteractorToPresenterInterface {
    func goToScoreView()
}

public class FinishGameInteractor: InteractorAsync<MatchingPairsUser> {
    
    var presenter: MatchingPairsFinishInteractorToPresenterInterface?
    var MatchingPairsRepository: MatchingPairRepositoryProtocol?
    
    public init(presenter: MatchingPairsFinishInteractorToPresenterInterface, repository: MatchingPairRepositoryProtocol) {
        self.presenter = presenter
        self.MatchingPairsRepository = repository
    }
    
    public override func buildUseCase(params request: MatchingPairsUser) {
        MatchingPairsRepository?.saveScore(user: request){ isSuccess in
            if isSuccess {
                self.presenter?.goToScoreView()
            }
        }
    }
    
}
