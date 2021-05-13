//MARK: 커스텀 탭바

import UIKit

class MainTabCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "MainTabCollectionViewCell"
    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var tabbarNameLabel: UILabel!
    
    func setData(name : String){
        tabbarNameLabel.text = name
    }
    override public var isSelected: Bool {
            didSet{
                self.tabbarNameLabel.textColor = isSelected ? UIColor(red: 103/255, green: 14/255, blue: 134/255, alpha: 1) : UIColor(red: 101/255, green: 102/255, blue: 103/255, alpha: 1)
                self.navigationView.backgroundColor = isSelected ? UIColor(red: 94/255, green: 23/255, blue: 129/255, alpha: 1) : UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            }
        }
}
