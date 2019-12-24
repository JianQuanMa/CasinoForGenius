//
//  Errors.swift
//  CasinoForGenius
//
//  Created by Jian Ma on 12/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation

enum TextToNumersError: Error{
    case isEmpty
    case hasRepeats
    case failToConvert
    case outOfRange
}

enum inputError: Error{
    case minMissing
    case maxMissing
    case textMissing
    case inputOutOfBoundaries
}
