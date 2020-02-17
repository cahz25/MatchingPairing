//
//  Configurator.swift
//  MatchingPairsGame
//
//  Created by Cesar  Hurtado on 4/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation
import CoreLayer
import DataLayer
import UIKit

class MatchingPairsConfigurator: NSObject, Abstract {
    
    func build(viewController: UIViewController) {
        let localDataSource = MatchingPairsLocalDataSource()
        let remoteDataSource = MatchingPairsRemoteDataSource()
        let repository = MatchingPairRepository(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
        let presenter = MatchingPairsPresenter()
        let generateGameInteractor = GenerateGameInteractor(repository: repository)
        let analizeSelectCardInteractor = AnalizeSelectCardInteractor(presenter: presenter, repository: repository)
        let finishGameInteractor = FinishGameInteractor(presenter: presenter, repository: repository)
        (viewController as? MatchingPairsViewController)?.presenter = presenter
        presenter.view = (viewController as? MatchingPairsViewController)
        presenter.generateGameInteractor = generateGameInteractor
        presenter.analizeSelectCardInteractor = analizeSelectCardInteractor
        presenter.finishGameInteractor = finishGameInteractor
    }
    
}
