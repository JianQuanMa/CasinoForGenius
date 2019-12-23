//
//  Calculator.swift
//  CasinoForGenius
//
//  Created by Jian Ma on 12/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation
class Calculator{
    
    private func generateRandomNumber(from min: Int, to max: Int) -> Int{
        return Int.random(in: min ..< max)
    }
    
    
    //return the closest number to generatedNum if there be one, if there is none, return -1
    func findWinner(sortedNumbers: [Int], generatedNum: Int) -> Int{
        
        if sortedNumbers.contains(generatedNum) {
            return generatedNum
        }
        
        var closetGap = sortedNumbers.last!
        var tempWinner = sortedNumbers.first!
        sortedNumbers.forEach{ num in
            if generatedNum.absoluteDistance(from: num) < closetGap{
                closetGap = generatedNum.absoluteDistance(from: num)
                tempWinner = num
            }
        }
        return tempWinner
    }
    
    //check deplicates in a sorted array
    func isContainDeplicates(sortedNums: [Int]) -> Bool{
        //        var result = false
        //        sortedNums.forEach{
        //            if $0 == $0.advanced(by: 1){
        //                result = true
        //            }
        //        }
        //        return result
        return sortedNums.count != Array(Set(sortedNums)).count
    }
    
    
}
