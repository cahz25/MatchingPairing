//
//  HomePresenter.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 24/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterInterface {
    
    var view: HomeViewInterface?
    
    func initHomeView() {
        view?.disableButton()
        view?.cleanTextField()
    }
    
    func validateTextField(text: String?) {
        if text != nil, text!.count > 1 {
            view?.enableButton()
        } else {
            view?.disableButton()
        }
    }
    
    func tapStartGame(nickname: String?) {
        if nickname != nil {
            view?.goToGameView(nickname: nickname!)
        }
    }
    
}
