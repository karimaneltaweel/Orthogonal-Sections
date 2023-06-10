//
//  OrthCell.swift
//  SectionsDemo
//
//  Created by kariman eltawel on 22/05/2023.
//

import UIKit

class OrthCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 10
    }
}
