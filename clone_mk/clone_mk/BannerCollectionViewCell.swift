//
//  BannerCollectionViewCell.swift
//  clone_mk
//
//  Created by 박익범 on 2021/05/13.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BannerCollectionViewCell"
    @IBOutlet weak var bannerImage: UIImageView!
    
    func setImage(imageName : String){
        if let userImage = UIImage(named: imageName){
            bannerImage.image = userImage
        }
    }
    
}
