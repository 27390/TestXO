//
//  BoardViewController.swift
//  TestXO

import UIKit

class BoardViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    //MARK: private
    private let sectionMinimumSeparator: CGFloat = 1
    private let boardSize: Int = 3
    private var gameViewModel: GameViewModel!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if gameViewModel == nil {
            gameViewModel = GameViewModelImpl.instantiate(boardSize: boardSize)
        }
    }
    
    //MARK: IBActions
    @IBAction func restartButtonPressed(_ sender: Any) {
        self.resetGame()
    }
    
    //MARK: UI methods
    private func resetGame () {
        self.titleLabel.text = ""
        self.boardCollectionView.isUserInteractionEnabled = true
        self.boardCollectionView.reloadData()
        self.gameViewModel.reset()
    }
    
    private func setupGameFinished(winnerPlayer: Player?) {
        self.boardCollectionView.isUserInteractionEnabled = false
        if winnerPlayer == Player.player1 {
            //TODO: should not hardcode that here
            self.titleLabel.text = "Player 1 won!"
        } else if winnerPlayer == Player.player2 {
            self.titleLabel.text = "Player 2 won!"
        } else {
            self.titleLabel.text = "Draw"
        }
    }
    
}

// MARK: - Collection View Datasource
extension BoardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameViewModel.getNumberOfGridItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.reuseIdentifier, for: indexPath) as? GridCell else {
            return GridCell()
        }
        cell.config()
        return cell
    }
    
}

// MARK: - Collection View Flow Layout Delegate
extension BoardViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionMinimumSeparator * CGFloat(gameViewModel.getNumberOfItemsPerRow() - 1)
        let availableWidth: CGFloat = collectionView.bounds.size.width - paddingSpace
        let sizePerItem: CGFloat = availableWidth / CGFloat(gameViewModel.getNumberOfItemsPerRow())
        
        return CGSize(width: sizePerItem, height: sizePerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0,
                            left: 0.0,
                            bottom: 0.0,
                            right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionMinimumSeparator
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionMinimumSeparator
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GridCell else {
            return
        }
        
        let player = self.gameViewModel.getPlayer(order: .current)
        cell.config(player: player)
        let row = indexPath.row / gameViewModel.getNumberOfItemsPerRow()
        let column = indexPath.row % gameViewModel.getNumberOfItemsPerRow()
        self.gameViewModel.endTurnWithMove(position: Position(row: row, column: column), player: player) { (gameOver, winningPositions, winningPlayer) in
            if gameOver {
                self.setupGameFinished(winnerPlayer: winningPlayer)
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GridCell else {
            return false
        }
        if cell.isSelected {
            return false
        }
        return true
    }
    
}
