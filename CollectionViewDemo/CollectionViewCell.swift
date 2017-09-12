//
//  CollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by lokizero00 on 2017/9/12.
//  Copyright © 2017年 lokizero00. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor(red: 23/255, green: 232/255, blue: 233/255, alpha: 1)
    }

}
