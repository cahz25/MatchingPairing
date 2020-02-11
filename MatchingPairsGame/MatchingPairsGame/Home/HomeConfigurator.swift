//
//  HomeConfigurator.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 24/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation
import CoreLayer
import DataLayer
import UIKit

class HomeConfigurator: NSObject, Abstract {
    
    func build(viewController: UIViewController) {
        let presenter = HomePresenter()
        (viewController as? HomeViewController)?.presenter = presenter
        presenter.view = (viewController as? HomeViewController)
    }
}
