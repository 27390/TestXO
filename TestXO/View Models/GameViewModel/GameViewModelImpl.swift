//
//  GameViewModelImpl.swift
//  TestXO
//
//  Created by Alex on 28/07/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation

class GameViewModelImpl {
    
    private var gameModel: GameModel
    
    init(boardSize: Int, numberOfItemsInLine: Int) {

        self.gameModel = GameModel(boardSize: boardSize, numberOfItemsInLineToWin: numberOfItemsInLine, actions: [], currentPlayer: .player1)
    }
    
    private func updateGameStatus() -> (gameOver: Bool, winningPositions: [Position]?) {
        
        return (gameOver: false, winningPositions: nil)
    }
    
    private func updateGameModelWithNewActionAtLocation(_ position: Position, player: Player) {
        let newAction = GameActionModel(position: position, player: player)
        gameModel.actions.append(newAction)
        gameModel.currentPlayer = getPlayer(order: .next)
    }
    
    private func getPreviousPlayer() -> Player {
        switch gameModel.currentPlayer {
        case .player1:
            return .player2
        case .player2:
            return .player1
        }
    }
    
    private func getNextPlayer() -> Player {
        switch gameModel.currentPlayer {
        case .player1:
            return .player2
        case .player2:
            return .player1
        }
    }
}

extension GameViewModelImpl: GameViewModel {
    func getNumberOfGridItems() -> Int {
        return gameModel.boardSize * gameModel.boardSize
    }
    
    func endTurnWithMove(position: Position, player: Player, completion: feedbackClosure?) {
        self.updateGameModelWithNewActionAtLocation(position, player: player)
        let gameOverCheckResult = self.updateGameStatus()
        completion?(gameOverCheckResult.gameOver, gameOverCheckResult.winningPositions, player)
    }
    
    public func getPlayer (order: PlayerOrder) -> Player {
        switch order {
        case .previous:
            return getPreviousPlayer()
        case .next:
            return getPreviousPlayer()
        case .current:
            return gameModel.currentPlayer
        }
    }
}
