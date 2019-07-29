//
//  BoardViewController.swift
//  TestXO
//
//  Created by Alex on 28/07/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var boardCollectionView: UICollectionView!
    
    //MARK: private
    private let sectionMinimumSeparator: CGFloat = 1
    private var gameViewModel: GameViewModel!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if gameViewModel == nil {
            
            //should not hardcode this
            gameViewModel = GameViewModelImpl(boardSize: 3, numberOfItemsInLine: 3)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    //MARK: IBActions
    @IBAction func restartButtonPressed(_ sender: Any) {
        
    }
    
    //MARK: UI methods
    func setupCollectionView () {
        
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
    
}
