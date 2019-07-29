//
//  GameViewModel.swift
//  TestXO
//
//  Created by Alex on 28/07/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation

protocol GameViewModel {
    
    typealias feedbackClosure = (_ gameCompleted: Bool, _ winningMoves: [Position]?, _ winningPlayer: Player) -> ()
    
    func getNumberOfGridItems () -> Int
    func endTurnWithMove (position: Position, player: Player, completion: feedbackClosure?)
    func getPlayer(order: PlayerOrder) -> Player
}
