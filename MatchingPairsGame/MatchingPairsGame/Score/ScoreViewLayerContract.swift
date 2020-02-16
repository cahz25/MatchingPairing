//
//  ScoreViewLayerContract.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 16/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation

protocol ScoreViewInterface: class {
    func drawScores(scores: [(title: String, subtitle: String)])
}

protocol ScorePresenterInterface {
    func getScores()
}
