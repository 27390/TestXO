//
//  Constants.swift
//  TestXO
//
//  Created by Alex on 28/07/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation

enum Player: Int {
    case player1 = 1
    case player2 = 2
}

enum PlayerOrder {
    case previous
    case current
    case next
}

typealias Position = (row: Int, column: Int)
