//
//  MainCoordinator.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 24/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    private let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func getViewController(storyboardId: String) -> UIViewController? {
        return storyboard.instantiateViewController(withIdentifier: storyboardId) as UIViewController?
    }
    
    func start() {
        let vc = HomeViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func startGame(nickname: String) {
        let viewController = getViewController(storyboardId: "MatchingPairsViewController")
        let matchingPairsViewController = viewController as! MatchingPairsViewController
        matchingPairsViewController.coordinator = self
        matchingPairsViewController.nickname = nickname
        navigationController.pushViewController(matchingPairsViewController, animated: true)
    }
    
    func score() {
        let viewController = getViewController(storyboardId: "ScoreViewController")
        let scoreViewController = viewController as! ScoreViewController
        scoreViewController.coordinator = self
        navigationController.pushViewController(scoreViewController, animated: true)
    }
    
}
