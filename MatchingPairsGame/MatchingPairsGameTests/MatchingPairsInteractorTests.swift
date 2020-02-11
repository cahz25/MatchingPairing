//
//  MatchingPairsInteractorTests.swift
//  MatchingPairsGameTests
//
//  Created by Cesar  Hurtado on 9/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import XCTest
@testable import MatchingPairsGame

class MatchingPairsInteractorTests: XCTestCase {
    
    var matchingPairsInteractor = MatchingPairsInteractor()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testCardInqueIdentify() {
        let card1 = MatchingPairsCard()
        let card2 = MatchingPairsCard()
        XCTAssertNotEqual(card1.identifier, card2.identifier, "The uniqueIdentify is incorrect")
    }
    
    func testAnalizeRulesForNil() {
        matchingPairsInteractor.indexOfOneAndOnlyFaceUpCard = nil
        let rule = matchingPairsInteractor.analizeRules(currentIndex: 1)
        XCTAssertEqual(rule, MatchingPairsActions.select,  "The select rule is wrong")
    }
    
    func testAnalizeRulesForEqualIndex() {
        matchingPairsInteractor.indexOfOneAndOnlyFaceUpCard = 1
        let rule = matchingPairsInteractor.analizeRules(currentIndex: 1)
        XCTAssertEqual(rule, MatchingPairsActions.select,  "The select rule is wrong")
    }
    
    func testAnalizeRulesForMatch() {
        let card1 = MatchingPairsCard()
        matchingPairsInteractor.concentrationCards = [card1, card1]
        matchingPairsInteractor.indexOfOneAndOnlyFaceUpCard = 0
        let rule = matchingPairsInteractor.analizeRules(currentIndex: 1)
        XCTAssertEqual(rule, MatchingPairsActions.match,  "The select match is wrong")
    }
    
    func testAnalizeRulesForIncorrect() {
        let card1 = MatchingPairsCard()
        let card2 = MatchingPairsCard()
        matchingPairsInteractor.concentrationCards = [card1, card2]
        matchingPairsInteractor.indexOfOneAndOnlyFaceUpCard = 0
        let rule = matchingPairsInteractor.analizeRules(currentIndex: 1)
        XCTAssertEqual(rule, MatchingPairsActions.incorrect,  "The incorrect rule is wrong")
    }

}
