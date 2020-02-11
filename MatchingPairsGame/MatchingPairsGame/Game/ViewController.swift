//
//  ViewController.swift
//  MatchingPairsGame
//
//  Created by Cesar  Hurtado on 4/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import UIKit

class MatchingPairsViewController: UIViewController, MatchingPairsViewInterface {

    @IBOutlet var concentrationCards: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var presenter : MatchingPairsPresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

