//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by DAS-DEV on 14/11/19.
//  Copyright © 2019 DAS-DEV. All rights reserved.
//

import UIKit

enum CollectionViewType: Int {
    case top = 0
    case bottom = 1
}

class ViewController: UIViewController {

    var titleData: TitleSection = TitleSection() {
        didSet {
            titleLabel.text = titleData.titleSection
            subtitleLabel.text = titleData.subtitle
        }
    }
    
    var topBases: [Base] = []
    var bottomBases: [Base] = []
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.titleData.titleSection = "testing"
            self.titleData.subtitle = "halo"
        }
        startFetch()
    }

    func startFetch() {
           //simulate API
       DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
           var text = ["A","B","C"]
           
           for t in text {
                let newCard = Card()
                newCard.label = t
                self.topBases.append(newCard)
           }
        
            text = ["1","2"]
            for t in text {
                 let titleSection = TitleSection()
                 titleSection.titleSection = t
                 self.bottomBases.append(titleSection)
            }
           
            self.topCollectionView.reloadData()
            self.bottomCollectionView.reloadData()
       }
   }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == CollectionViewType.top.rawValue {
            return topBases.count
        } else {
            return bottomBases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 9.0 / 16.0 * view.frame.width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == CollectionViewType.top.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as? CardCollectionViewCell
            cell?.base = topBases[indexPath.row]
            
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as? TestCollectionViewCell
            cell?.base = bottomBases[indexPath.row]
            return cell ?? UICollectionViewCell()
        }
    }
}

