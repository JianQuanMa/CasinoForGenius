//
//  String+Extension.swift
//  CasinoForGenius
//
//  Created by Jian Ma on 12/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

extension String{
    
    enum StringToIntError: Error{
        case emptyStringError
        case failToConvertError
    }
    
    var isInt: Bool{
        return Int(self) != nil
    }
    
    func intValue() throws -> Int{
        if self.isEmpty { throw StringToIntError.emptyStringError}
        if Int(self) == nil { throw StringToIntError.failToConvertError}
        return Int(self)!
    }
    //convert text to int array
    func convertToIntArray() -> [Int]{
        let texts = self.split(separator: ",")
        let array = texts.map{numtext in
            return Int(numtext)!
        }
        return array
    }
    
}
