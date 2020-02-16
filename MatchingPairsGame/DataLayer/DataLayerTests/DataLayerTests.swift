//
//  DataLayerTests.swift
//  DataLayerTests
//
//  Created by Cesar  Hurtado on 23/11/19.
//  Copyright © 2019 cahz. All rights reserved.
//

import XCTest
@testable import DataLayer

class DataLayerTests: XCTestCase {
    
    var matchingPairRepository = MatchingPairRepository()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAnalizeInsert() {
        matchingPairRepository.saveScore(score: 30, nickname: "CAHZ") { (isSuccess) in
            if isSuccess != nil {
                self.matchingPairRepository.getScores { (isSuccess, scores) in
                    let count = scores.count
                    XCTAssertEqual(30, scores[count-1].score,  "The insert is wrong")
                }
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
