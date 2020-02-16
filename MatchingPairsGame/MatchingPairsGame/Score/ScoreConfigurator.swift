//
//  ScoreConfigurator.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 16/02/20.
//  Copyright © 2020 cahz. All rights reserved.
//

import Foundation
import CoreLayer
import DataLayer
import UIKit

class ScoreConfigurator: NSObject, Abstract {
    
    func build(viewController: UIViewController) {
        let repository = MatchingPairRepository()
        let presenter = ScorePresenter()
        let getScoresInteractor = GetScoresInteractor(presenter: presenter, repository: repository)
        (viewController as? ScoreViewController)?.presenter = presenter
        presenter.view = (viewController as? ScoreViewController)
        presenter.getScoresInteractor = getScoresInteractor
    }
    
}
