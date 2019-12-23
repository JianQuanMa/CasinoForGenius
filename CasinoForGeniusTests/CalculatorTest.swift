//
//  CalculatorTest.swift
//  CasinoForGeniusTests
//
//  Created by Jian Ma on 12/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//
@testable import CasinoForGenius
import XCTest

class CalculatorTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFindWinnerWithWinner(){
        let cal = Calculator()
        let ranNum = 78
        let nums = [23,34,45,67,79,99]
        
        XCTAssertTrue(cal.findWinner(sortedNumbers: nums, generatedNum: ranNum) == 79)
    }
    func testFindWinnerWithoutWinner(){
        let cal = Calculator()
        let ranNum = 79
        let nums = [23,34,45,67,78,80]
        XCTAssertTrue(cal.findWinner(sortedNumbers: nums, generatedNum: ranNum) == 79)
    }
    
    func testIsContainDeplicateWithDuplicates(){
        let cal = Calculator()
        let nums = [1,2,3,3,4]
        XCTAssertTrue(cal.isContainDeplicates(sortedNums: nums))
    }
    
    func testIsContainDeplicateWithoutDuplicates(){
        let cal = Calculator()
        let nums = [1,2,3,4]
        XCTAssertFalse(cal.isContainDeplicates(sortedNums: nums))
    }
    func testIsContainDeplicateWithEmptyArray(){
        let cal = Calculator()
        let nums:[Int] = []
        XCTAssertFalse(cal.isContainDeplicates(sortedNums: nums))
    }
    
    
}
