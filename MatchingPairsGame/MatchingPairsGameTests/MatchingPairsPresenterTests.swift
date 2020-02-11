//
//  MatchingPairsPresenterTests.swift
//  MatchingPairsGameTests
//
//  Created by Cesar  Hurtado on 9/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import XCTest
@testable import MatchingPairsGame

class MatchingPairsPresenterTests: XCTestCase {

    var matchingPairsPresenter = MatchingPairsPresenter()

    override func setUp() {
    }
    
    func testGetCardValueWithEmptyCardsValues() {
        var emojisValues: Array<String> = ["🎃","👻","🐷"]
        let index = 0
        matchingPairsPresenter.cardsValues = [Int: String]()
        let initEmojisValuesCount = emojisValues.count
        let value = matchingPairsPresenter.getCardValue(showCardIndentifier: index, arrayOfValues: &emojisValues)
        XCTAssertLessThan(emojisValues.count, initEmojisValuesCount, "The array doesn't modify")
        XCTAssertNil(emojisValues.firstIndex(of: value), "The element exist in array")
        XCTAssertEqual(value, matchingPairsPresenter.cardsValues[index], "The value set wrong")
    }
    
    func testGetCardValueWithIndexInCardsValue() {
        var emojisValues: Array<String> = ["🎃","👻"]
        let index = 0
        matchingPairsPresenter.cardsValues = [0: "🐷"]
        let initEmojisValuesCount = emojisValues.count
        let value = matchingPairsPresenter.getCardValue(showCardIndentifier: index, arrayOfValues: &emojisValues)
        XCTAssertEqual(emojisValues.count, initEmojisValuesCount, "The array was modify")
        XCTAssertEqual(value, "🐷", "The value set wrong")
    }
    
    func testGetCardValueWithOutIndexInCardsValue() {
        var emojisValues: Array<String> = ["🎃","👻"]
        let index = 1
        matchingPairsPresenter.cardsValues = [0: "🐷"]
        let initEmojisValuesCount = emojisValues.count
        let value = matchingPairsPresenter.getCardValue(showCardIndentifier: index, arrayOfValues: &emojisValues)
        XCTAssertLessThan(emojisValues.count, initEmojisValuesCount, "The array doesn't modify")
        XCTAssertNil(emojisValues.firstIndex(of: value), "The element exist in array")
        XCTAssertEqual(value, matchingPairsPresenter.cardsValues[index], "The value set wrong")
    }
    
    func testGetCardValueWithEmptyArrayOfValues() {
        var emojisValues: Array<String> = [String]()
        let index = 1
        matchingPairsPresenter.cardsValues = [0: "🐷"]
        let value = matchingPairsPresenter.getCardValue(showCardIndentifier: index, arrayOfValues: &emojisValues)
        XCTAssertEqual(value, "?", "The value set wrong")
    }
    
    func testGetRandomCardValue() {
        var emojisValues: Array<String> = ["🎃","👻","🐷"]
        let initEmojisValuesCount = emojisValues.count
        let value = matchingPairsPresenter.getRandomCardValue(arrayOfValues: &emojisValues)
        XCTAssertLessThan(emojisValues.count, initEmojisValuesCount, "The array doesn't modify")
        XCTAssertNil(emojisValues.firstIndex(of: value), "The element exist in array")
    }

    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }

}
