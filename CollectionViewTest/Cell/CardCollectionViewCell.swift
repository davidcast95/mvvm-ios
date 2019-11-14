//
//  CardCollectionViewCell.swift
//  CollectionViewTest
//
//  Created by DAS-DEV on 14/11/19.
//  Copyright © 2019 DAS-DEV. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    var base: Base = Base() {
        didSet {
            if let card = base as? Card {
                label.text = card.label
            }
            
        }
    }
    
    @IBOutlet weak var label: UILabel!
}
