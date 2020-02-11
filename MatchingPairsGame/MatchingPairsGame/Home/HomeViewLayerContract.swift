//
//  HomeViewLayerContract.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 24/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

protocol HomeViewInterface: class {
    func enableButton()
    func disableButton()
    func cleanTextField()
    func goToGameView(nickname: String)
}

protocol HomePresenterInterface {
    func initHomeView()
    func validateTextField(text: String?)
    func tapStartGame(nickname: String?)
}
