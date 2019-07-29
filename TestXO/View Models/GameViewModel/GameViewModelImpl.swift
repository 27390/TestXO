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
    
    private func updateGameStatusWithPosition(_ position:Position, player: Player) -> (gameOver: Bool, winningPositions: [Position]?, player: Player?) {
        
        var possibleLine: [GameActionModel] = []
        // go on line from the specified position
        possibleLine = gameModel.actions.filter({$0.position.row == position.row && $0.player == player})
        if possibleLine.count == gameModel.numberOfItemsInLineToWin {
            let positions = possibleLine.map({ (actionModel) -> Position in
                return actionModel.position
            })
            return (gameOver: true, winningPositions: positions, player: player)
        }
        // go on column from specified position
        possibleLine = gameModel.actions.filter({$0.position.column == position.column && $0.player == player})
        if possibleLine.count == gameModel.numberOfItemsInLineToWin {
            let positions = possibleLine.map({ (actionModel) -> Position in
                return actionModel.position
            })
            return (gameOver: true, winningPositions: positions, player: player)
        }
        // go in diagonal from specified position
        
        
        // if 9 moves, end game
        if self.gameModel.actions.count == 9 {
            return (gameOver: true, winningPositions: nil, player: nil)
        }
        //default don't end game
        return (gameOver: false, winningPositions: nil, player: nil)
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
    func getNumberOfItemsPerRow() -> Int {
        return gameModel.boardSize
    }
    
    func resetGame() {
        
    }
    
    func getNumberOfGridItems() -> Int {
        return gameModel.boardSize * gameModel.boardSize
    }
    
    func endTurnWithMove(position: Position, player: Player, completion: feedbackClosure?) {
        self.updateGameModelWithNewActionAtLocation(position, player: player)
        let gameOverCheckResult = self.updateGameStatusWithPosition(position, player: player)
        completion?(gameOverCheckResult.gameOver, gameOverCheckResult.winningPositions, gameOverCheckResult.player)
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
