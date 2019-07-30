//
//  Position.swift
//  TestXO
//
//  Created by Alex on 29/07/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation
struct Position {
    let row: Int
    let column: Int
}

extension Position: Equatable {
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.row == rhs.row &&
            lhs.column == rhs.column
    }
    
}
