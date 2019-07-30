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
    case current
    case next
}

enum ImageNames: String {
    case imageX = "img_x"
    case imageO = "img_o"
}
