//
//  ThisShopCollectionViewCell.swift
//  clone_mk
//
//  Created by 박익범 on 2021/05/14.
//

import UIKit

class ThisShopCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "ThisShopCollectionViewCell"
    
    
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setShopdata(name : String, discount : String, price : String, imageName : String){
        if let userImage = UIImage(named: imageName){
            bannerImage.image = userImage
        }
        nameLabel.text = name
        discountLabel.text = discount
        priceLabel.text = price
    }
}
