//
//  Winner.swift
//  CasinoForGenius
//
//  Created by Jian Ma on 12/23/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation


enum WinnerType: Equatable{
    case exist(Int)
    case notExist
    case inputOutOfBoundaries
    func getValue() -> Int {
        switch self{
        case .exist(let intValue):
            return intValue
        case .notExist, .inputOutOfBoundaries:
            return -1
        }
    }
}
