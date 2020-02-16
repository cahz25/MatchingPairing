//
//  MatchingPairsViewController.swift
//  MatchingPairsGame
//
//  Created by Cesar  Hurtado on 4/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import UIKit

class MatchingPairsViewController: BaseViewController {
    
    @IBOutlet var concentrationCards: [UIButton]!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var presenter : MatchingPairsPresenterInterface?
    var nickname = String()
    var timer = Timer()
    var timeRemaining = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.initGame(numberOfPairs: concentrationCards.count / 2)
        nicknameLabel.text = nickname
        score.text = "00:00"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //presenter?.initGame(numberOfPairs: concentrationCards.count / 2)
    }
    
    
    @IBAction func selectCard(_ sender: UIButton) {
        presenter?.selectCard(index: concentrationCards.firstIndex(of: sender))
    }
    
    @objc func timerRunning() {
        timeRemaining += 1
        let minutes = Int(timeRemaining) / 60 % 60
        let seconds = Int(timeRemaining) % 60
        score.text = String(format:"%02i:%02i", minutes, seconds)
    }

}

extension MatchingPairsViewController: MatchingPairsViewInterface {
    
    func destroyCard(cardIndex: Int) {
        UIView.transition(with: concentrationCards[cardIndex], duration: 0.3, options: .transitionCurlUp, animations: {
            self.concentrationCards[cardIndex].setTitle("", for: .normal)
            self.concentrationCards[cardIndex].backgroundColor = .clear
        }) { (Bool) in
            self.concentrationCards[cardIndex].isHidden = true
        }
    }
    
    func hideCard(hideCardIndex: Int) {
        UIView.transition(with: concentrationCards[hideCardIndex], duration: 0.3, options: .transitionFlipFromRight, animations: {
            self.concentrationCards[hideCardIndex].backgroundColor = .systemPink
            self.concentrationCards[hideCardIndex].setTitle("", for: .normal)
        })
    }
    
    func showCard(showCardIndex: Int, cardValue: String) {
        UIView.transition(with: concentrationCards[showCardIndex], duration: 0.3, options: .transitionFlipFromLeft, animations: {
            self.concentrationCards[showCardIndex].backgroundColor = .gray
            self.concentrationCards[showCardIndex].setTitle(cardValue, for: .normal)
        })
    }
    
    func initTimer() {
        timeRemaining = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRunning), userInfo: nil, repeats: true)
    }
    
    func finishGame() {
        timer.invalidate()
        print(timeRemaining)
        presenter?.finishGame(score: timeRemaining, nickname: nickname)
    }
    
    func goToScore() {
        coordinator?.score()
    }
}
