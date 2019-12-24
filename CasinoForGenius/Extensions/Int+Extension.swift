//
//  Int+Extension.swift
//  CasinoForGenius
//
//  Created by Jian Ma on 12/22/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation


extension Int{
    
    var absoluteValue: Int {
        if (self >= 0) {return self} else {return -self}
    }
    
    func absoluteDistance(from num: Int) -> Int{
        return (self - num).absoluteValue
    }
}

extension Array where Element == Int {
    func checkBoundary(from min: Int, to max: Int) -> Bool{
        for num in self{
            if num < min || num > max{
                return false
            }
        }
        return true
    }
}
