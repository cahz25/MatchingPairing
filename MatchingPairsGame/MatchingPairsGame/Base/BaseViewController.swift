//
//  BaseViewController.swift
//  MatchingPairsGame
//
//  Created by Cesar  Hurtado on 7/12/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.ownInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.ownInit()
    }

    private func ownInit() {
        let className = NSStringFromClass(self.classForCoder)
        AppConfigurator.sharedInstance.inject(self, className: className)
    }
}
