//
//  GridCell.swift
//  TestXO
//


import UIKit

class GridCell: UICollectionViewCell {
    @IBOutlet weak var tokenImage: UIImageView!
    
    //MARK: public variables
    public static let reuseIdentifier = "gridCellReuseID"
    
    //MARK: private variables
    
    func config (player: Player? = nil){
        if let player = player {
            switch player {
            case .player1:
                self.tokenImage.image = UIImage(named: ImageNames.imageX.rawValue)
            case .player2:
                self.tokenImage.image = UIImage(named: ImageNames.imageO.rawValue)
            }
        } else {
            //MARK: writen like this to save time, should change
            self.tokenImage.image = nil
        }
        
    }
    
}
