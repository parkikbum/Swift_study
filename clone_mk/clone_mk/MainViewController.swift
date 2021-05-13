import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var menuTabbar: UICollectionView!
    @IBOutlet weak var mainTabbar: UICollectionView!

    
    private var barName : [mainDataModel] = []
    private var labelName :[mainCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBarname()
        setLabel()
        
        menuTabbar.delegate = self
        menuTabbar.dataSource = self
        menuTabbar.isScrollEnabled = false
        menuTabbar.tag = 1
        
        
        mainTabbar.delegate = self
        mainTabbar.dataSource = self
        mainTabbar.isPagingEnabled = true
        mainTabbar.tag = 2
        let flowLayout = mainTabbar.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.scrollDirection = .horizontal
                
    }
    func setBarname(){
        barName.append(contentsOf: [mainDataModel(tabName: "컬리추천"), mainDataModel(tabName: "신상품"), mainDataModel(tabName: "베스트"), mainDataModel(tabName: "알뜰쇼핑"), mainDataModel(tabName: "특가/혜택")])
    }
    func setLabel(){
        labelName.append(contentsOf: [mainCellModel(backgroundLabel: "1"), mainCellModel(backgroundLabel: "2"),mainCellModel(backgroundLabel: "3"),mainCellModel(backgroundLabel: "4"),mainCellModel(backgroundLabel: "5")])
    }
}

//MARK: extention


//MARK: delegate
extension MainViewController : UICollectionViewDelegate{
    
    
}
extension MainViewController : UICollectionViewDataSource{
    // tableView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return 5
        }
        if collectionView.tag == 2{
            return 5
        }
        return 0
    }
    // 커스텀 탭바랑 연동 그 배열의 인덱스 * 총 배경화면의 길이

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let width = UIScreen.main.bounds.width
        if barName[indexPath.row].tabName == "컬리추천"{
            mainTabbar.setContentOffset(CGPoint(x: 0 * Int(width) , y: 0), animated: true)
        }
        if barName[indexPath.row].tabName == "신상품"{
            mainTabbar.setContentOffset(CGPoint(x: 1 * Int(width) , y: 0), animated: true)
        }
        if barName[indexPath.row].tabName == "베스트"{
            mainTabbar.setContentOffset(CGPoint(x: 2 * Int(width) , y: 0), animated: true)
        }
        if barName[indexPath.row].tabName == "알뜰쇼핑"{
            mainTabbar.setContentOffset(CGPoint(x: 3 * Int(width) , y: 0), animated: true)
        }
        if barName[indexPath.row].tabName == "특가/혜택"{
            mainTabbar.setContentOffset(CGPoint(x: 4 * Int(width) , y: 0), animated: true)
        }
        
       }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
           let indexPathT = IndexPath(item: itemAt, section: 0)
           menuTabbar.selectItem(at: indexPathT, animated: true, scrollPosition: [])
        
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      //커스텀 탭바
        if collectionView.tag == 1{
            guard let barCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainTabCollectionViewCell.identifier, for: indexPath) as? MainTabCollectionViewCell else {return UICollectionViewCell() }
        barCell.setData(name: barName[indexPath.row].tabName)
        return barCell
        }
        if collectionView.tag == 2{
            guard let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainBannerCollectionViewCell.identifier, for: indexPath) as?
                MainBannerCollectionViewCell else {return UICollectionViewCell() }
            mainCell.isDelegate()
            return mainCell
        }
        return UICollectionViewCell()
    }
}
//MARK: flowlayout
extension MainViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1{
            let width = UIScreen.main.bounds.width
            let cellWidth = width * (69/375)
            let cellHeight = cellWidth * (44/69)
            return CGSize(width: cellWidth, height: cellHeight)
        }
        if collectionView.tag == 2{
            let width = UIScreen.main.bounds.width
            let cellWidth = width * (375/375)
            let cellHeight = cellWidth * (750/375)
            return CGSize(width: cellWidth, height: cellHeight)
        }
        
        return CGSize()
        }
 
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets.zero
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    
}
