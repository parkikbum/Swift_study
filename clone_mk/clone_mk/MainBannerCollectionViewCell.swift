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
    }
}
extension MainBannerCollectionViewCell : UITableViewDelegate{
   
}
extension MainBannerCollectionViewCell : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bannerCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {return UITableViewCell() }
        bannerCell.delegateIn()
        return bannerCell
    }
}

