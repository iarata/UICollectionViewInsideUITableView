//
//  AnimesTableViewCell.swift
//  UICollectionViewInsideUITableView
//
//  Created by Alireza Hajebrahimi on 2019/09/28.
//  Copyright © 2019 Alireza Hajebrahimi. All rights reserved.
//

import UIKit
import Kingfisher

class AnimesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var animeUICollectionView: UICollectionView!
    var myANIMEtableCellArray = [Anime]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: -- UICollectionView Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myANIMEtableCellArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cCell = animeUICollectionView.dequeueReusableCell(withReuseIdentifier: "animeCollectionCell", for: indexPath) as! AnimeCollectionViewCell
        cCell.animeIMAGE.kf.setImage(with: URL(string: myANIMEtableCellArray[indexPath.row].image_url))
        
        return cCell
    }

}
