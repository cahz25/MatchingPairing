//
//  FinishGameInteractor.swift
//  CoreLayer
//
//  Created by Cesar  Hurtado on 9/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation

public struct FinishGameInteractorModel {
    public struct request {
        var score: Int
        var nickname: String
        
        public init(score: Int, nickname: String){
            self.score = score
            self.nickname = nickname
        }
    }
}

public class FinishGameInteractor: InteractorAsync<FinishGameInteractorModel.request> {
    
    var MatchingPairsRepository: MatchingPairRepositoryProtocol?
    
    public init(repository: MatchingPairRepositoryProtocol) {
        self.MatchingPairsRepository = repository
    }
    
    public override func buildUseCase(params request: FinishGameInteractorModel.request) {
        MatchingPairsRepository?.saveScore(score: request.score, nickname: request.nickname){ result in
            if result == nil {
                
            }
        }
    }
    
}
