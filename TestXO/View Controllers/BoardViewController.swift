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
    private let itemsPerRow: CGFloat = 3
    private let sectionMinimumSeparator: CGFloat = 1
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 9
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
        
        let paddingSpace = sectionMinimumSeparator * (itemsPerRow - 1)
        let availableWidth: CGFloat = collectionView.bounds.size.width - paddingSpace
        let sizePerItem: CGFloat = (availableWidth / itemsPerRow)
        
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
