//
//  ViewController.swift
//  SectionsDemo
//
//  Created by kariman eltawel on 22/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
        
    }
    func createLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            switch sectionIndex{
            case 0:
                // item
                let fullView = compoitionalLayout.createItem(itemWidth: .fractionalWidth(0.7), itemHeight: .fractionalHeight(1), itemSpacing: 10)
                
                let smallView = compoitionalLayout.createItem(itemWidth: .fractionalWidth(1), itemHeight: .fractionalHeight(1), itemSpacing: 10)
                
                let groupOftwoViews = compoitionalLayout.createGroupWithItem(alignment: .vertical, groupWidth:.fractionalWidth(0.3), groupHeight: .fractionalHeight(1), item: smallView, count: 2)
                // group
                let group = compoitionalLayout.createGroupWithItems(alignment: .horizontal, groupWidth:.fractionalWidth(0.8), groupHeight: .fractionalHeight(0.4), items: [fullView,groupOftwoViews])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            case 1:
                // item
                let fullView = compoitionalLayout.createItem(itemWidth: .fractionalWidth(0.7), itemHeight: .fractionalHeight(1), itemSpacing: 10)
                
                let smallView = compoitionalLayout.createItem(itemWidth: .fractionalWidth(1), itemHeight: .fractionalHeight(1), itemSpacing: 10)
                
                let groupOftwoViews = compoitionalLayout.createGroupWithItem(alignment: .vertical, groupWidth:.fractionalWidth(0.3), groupHeight: .fractionalHeight(1), item: smallView, count: 2)
                // group
                let group = compoitionalLayout.createGroupWithItems(alignment: .horizontal, groupWidth:.fractionalWidth(0.8), groupHeight: .fractionalHeight(0.4), items: [fullView,groupOftwoViews])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            default:
                return nil
            }
        }
        
    }
    
}

extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numOfItem = 0
        switch section{
        case 0:
            numOfItem = 8
        case 1:
            numOfItem = 10
        default:
            numOfItem = 0
        }
        return numOfItem
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrthCell", for: indexPath) as! OrthCell
        return cell
    }
    
}

