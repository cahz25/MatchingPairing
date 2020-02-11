//
//  BaseContract.swift
//  MatchingPairsGame
//
//  Created by Cesar  Hurtado on 7/12/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation

protocol BaseView : class {
    
}

protocol BasePresenterProtocol : class {
    func bind(view: BaseView)
    func unBind()
}
