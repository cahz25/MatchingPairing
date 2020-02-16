//
//  HomeViewController.swift
//  MatchingPairsGame
//
//  Created by Augusto Hurtado on 24/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var textfiled_nickname: UITextField!
    @IBOutlet weak var btn_init_game: UIButton!
    
    var presenter: HomePresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Reset NavigationController
        self.navigationController?.viewControllers = [self]
        // Hide BackButton
        self.navigationItem.hidesBackButton = true
        
        presenter?.initHomeView()
    }
    
    @IBAction func typingNickname(_ sender: UITextField) {
        presenter?.validateTextField(text: sender.text)
    }
    
    @IBAction func tapStartGame(_ sender: UIButton) {
        presenter?.tapStartGame(nickname: textfiled_nickname.text)
    }
}

extension HomeViewController: HomeViewInterface {
    
    func enableButton() {
        btn_init_game.isHidden = false
    }
    
    func disableButton() {
        btn_init_game.isHidden = true
    }
    
    func cleanTextField() {
        textfiled_nickname.text = nil
    }
    
    func goToGameView(nickname: String) {
        coordinator?.startGame(nickname: nickname)
    }
    
}
