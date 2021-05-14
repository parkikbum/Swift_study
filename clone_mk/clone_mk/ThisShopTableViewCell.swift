//
//  ThisShopTableViewCell.swift
//  clone_mk
//
//  Created by 박익범 on 2021/05/14.
//

import UIKit

class ThisShopTableViewCell: UITableViewCell {
    @IBOutlet weak var thisShopCollectionView: UICollectionView!
    
    static let identifier : String = "ThisShopTableViewCell"
    
    
    private var thisList : [thisShop] = []
    
    func setCellImage(){
        thisList.append(contentsOf: [thisShop(imageName: "price1", name: "무농약 고추 5종", price: "1,550원", discount: "0%"), thisShop(imageName: "price2", name: "친환경 대추방울 토마토", price: "5,520원", discount: "20%"), thisShop(imageName: "price3", name: "밀가루", price: "3600", discount: "0%")])
    }
    
    func isDelegate(){
        thisShopCollectionView.delegate = self
        thisShopCollectionView.dataSource = self
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ThisShopTableViewCell : UICollectionViewDelegate{
    
}
extension ThisShopTableViewCell : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        thisList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: ThisShopCollectionViewCell.identifier, for: indexPath) as? ThisShopCollectionViewCell else {return UICollectionViewCell() }
        bannerCell.setShopdata(name: thisList[indexPath.row].name, discount: thisList[indexPath.row].discount, price: thisList[indexPath.row].price, imageName: thisList[indexPath.row].imageName)
        return bannerCell
    }
    
    
}
extension ThisShopTableViewCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellWidth = width * (150/375)
        let cellHeight = cellWidth * (300/150)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
}
