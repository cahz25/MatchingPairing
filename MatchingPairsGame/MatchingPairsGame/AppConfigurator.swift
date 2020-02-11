//
//  AppConfigurator.swift
//  MatchingPairsGame
//
//  Created by Cesar  Hurtado on 7/12/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation
import UIKit

protocol Abstract {
    func build(viewController: UIViewController)
}

class AppConfigurator {
    
    static let sharedInstance = AppConfigurator()
    var modules = [String: Abstract]()
    
    init() {
        modules[NSStringFromClass(MatchingPairsViewController.self.classForCoder())] = MatchingPairsConfigurator()
        
        modules[NSStringFromClass(HomeViewController.self.classForCoder())] = HomeConfigurator()
    }
    
    func inject(_ viewController: UIViewController, className: String) {
        modules[className]?.build(viewController: viewController)
    }
    
}
