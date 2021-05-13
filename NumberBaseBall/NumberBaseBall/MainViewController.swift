import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func startBurronClicked(_ sender: Any) {
        guard let playVC = storyboard?.instantiateViewController(identifier: "PlayViewController") as? PlayViewController else{return}
        self.present(playVC, animated: true, completion: nil)
        
    }
    @IBAction func showScoreButtonClicked(_ sender: Any) {
    }
    
}
