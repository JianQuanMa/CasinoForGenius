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
    func findWinner(sortedNumbers: [Int], generatedNum: Int) -> WinnerType{
        
        if sortedNumbers.count == 0 {
            return .notExist
        }
        
        if sortedNumbers.contains(generatedNum) {
            return .exist(generatedNum)
        }
        
        var closetGap = IntegerLiteralType.max
        
        var tempWinner: Int!
        
        for num in sortedNumbers{
            if generatedNum.absoluteDistance(from: num) < closetGap{
                closetGap = generatedNum.absoluteDistance(from: num)
                tempWinner = num
                print("abs gap " , generatedNum.absoluteDistance(from: num))
                
            }else if generatedNum.absoluteDistance(from: num) == closetGap{
                return .notExist
            }
        }
        return .exist(tempWinner)
    }
    
    //checks if the array contains any duplicate
    func isContainDeplicates(sortedNums: [Int]) -> Bool{
        return sortedNums.count != Set(sortedNums).count
    }

    
    func calculateAndAnalyize(min: Int, max: Int, text: String) -> WinnerType{
        
        let sortedInputIntArray = text.convertToIntArray().sorted()
        guard sortedInputIntArray.checkBoundary(from: min, to: max) else{return .inputOutOfBoundaries}
        
        var ranNum: Int!
        var resultWinner: WinnerType = .notExist
        
        repeat{
            ranNum = generateRandomNumber(from: min, to: max)
            
            resultWinner = findWinner(sortedNumbers: sortedInputIntArray, generatedNum: ranNum)
            print("the random number is: \(ranNum) and winner is: \(resultWinner)")
        }while(
            resultWinner == .notExist
        )
        return resultWinner
    }
}
