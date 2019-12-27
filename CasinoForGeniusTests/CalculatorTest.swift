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
        let cal = Calculator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFindWinnerWithWinner(){
        let cal = Calculator()
        let ranNum = 78
        let ranNum2 = 23
        let nums = [23,34,45,67,79,99]
        XCTAssertEqual(cal.findWinner(sortedNumbers: nums, generatedNum: ranNum) , WinnerType.exist(79))
        XCTAssertEqual(cal.findWinner(sortedNumbers: nums, generatedNum: ranNum2) , WinnerType.exist(23))
    }
    
    func testFindWinnerWithWinner2(){
        let cal = Calculator()
        let ranNum = 79
        let nums = [1,2,3,4,5,34]
        XCTAssertEqual(cal.findWinner(sortedNumbers: nums, generatedNum: ranNum), WinnerType.exist(34))
       
    }
    func testFindWinnerWithoutWinner(){
        let cal = Calculator()
        let ranNum = 78
        let nums = [23,34,45,67,79,77]
        XCTAssertEqual(cal.findWinner(sortedNumbers: nums, generatedNum: ranNum), WinnerType.notExist)
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
    func testTextConversion(){
      //   let text = "23,45,12,2,23"
         let text = ",,12,,23,34,22,12,,,"
         let expectedresult = [12,23,34,22,12]
         print(text.split(separator: ","))
        XCTAssertEqual(text.convertToIntArray(), expectedresult)
     }
    
    
}
