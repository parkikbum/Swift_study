//MARK: 메인 컬렉션 뷰
import UIKit

class MainBannerCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var mainTableView: UITableView!
    
    static let identifier = "MainBannerCollectionViewCell"
    

    override var isSelected: Bool {
            didSet{
            }
        }
    
    func isDelegate(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = .none
    }
    func notDelegate(){
        mainTableView.separatorStyle = .singleLine
    }
}
extension MainBannerCollectionViewCell : UITableViewDelegate{
    func tableView(_ tableView : UITableView, heightForRowAt indextPath: IndexPath) -> CGFloat{
        return 340
    }
}
extension MainBannerCollectionViewCell : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bannerCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as? MainTableViewCell else {return UITableViewCell() }
        guard let thisCell = tableView.dequeueReusableCell(withIdentifier: ThisShopTableViewCell.identifier) as? ThisShopTableViewCell else {return UITableViewCell() }
        print("인덱스 패쓰는" ,indexPath.row)
        if indexPath.row == 0{
        bannerCell.setCellImage()
        bannerCell.delegateIn()
            print("11인덱스 패쓰는",indexPath.row)
            return bannerCell
        }
        if indexPath.row == 1{
            print("22인덱스 패쓰는",indexPath.row)
            thisCell.setCellImage()
            thisCell.isDelegate()
            return thisCell
        }
        return UITableViewCell()
        
    }
    
}

