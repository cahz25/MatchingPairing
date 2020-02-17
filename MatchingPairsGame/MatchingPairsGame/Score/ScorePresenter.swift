//
//  ScorePresenter.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 16/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation
import CoreLayer

class ScorePresenter: ScorePresenterInterface {
    
    var view: ScoreViewInterface?
    var getScoresInteractor: InteractorAsync<Int>?
    let NUMBER_OF_SCORES_TO_SHOW = 10
    
    func getScores() {
        getScoresInteractor?.execute(params: NUMBER_OF_SCORES_TO_SHOW)
    }
    
    func intToTime(_ time: Int) -> String {
        let minutes = time / 60 % 60
        let seconds = time % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func mappingToView(_ scores: [MatchingPairsUser]) ->  [(title: String, subtitle: String)] {
        var scoreToView = [(title: String, subtitle: String)]()
        for score in scores {
            scoreToView.append((title: score.nickname, subtitle: intToTime(score.score)))
        }
        
        return scoreToView
    }
    
}

extension ScorePresenter: GetScoreInteractorToPresenterInterface {
    
    func showScoreList(scores: [MatchingPairsUser]?) {
        if scores != nil, scores!.count > 0 {
            view?.drawScores(scores: mappingToView(scores!))
        }
        
    }
    
}
