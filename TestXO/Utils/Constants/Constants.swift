//
//  Constants.swift
//  TestXO

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
