//
//  Coordinator.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 24/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
