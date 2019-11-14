//
//  FetchDataCollectionView.swift
//  CollectionViewTest
//
//  Created by DAS-DEV on 14/11/19.
//  Copyright © 2019 DAS-DEV. All rights reserved.
//

import UIKit

protocol FetchDataCollectionViewDelegate {
    func fetchDataCollectionView(numberOfItemsInSection section: Int) -> Int
    func fetchDataCollectionView(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//    func fetchDataCollectionView(didFetch dataRequest: URLSessionDataTask)
}


class FetchDataCollectionView: UICollectionView {

    var fetchDataDelegate: FetchDataCollectionViewDelegate?
    
    func setup() {
        self.delegate = self
        self.dataSource = self
    }
    
   
    
    

}

extension FetchDataCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchDataDelegate?.fetchDataCollectionView(numberOfItemsInSection: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return fetchDataDelegate?.fetchDataCollectionView(cellForItemAt: indexPath) ?? UICollectionViewCell()
    }
    
    
}
