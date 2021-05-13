
import UIKit

class MainViewController: UIViewController, sampleProtocol {
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "DelegateViewController") as? DelegateViewController else{return}
       // nextVC.delegate = self
        NotificationCenter.default.addObserver(self,selector: #selector(dataReceived), name: NSNotification.Name("sample"), object: nil)
        
        
        
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    func dataSend(data : String){
        mainLabel.text = data
    }
    @IBAction func ButtonClicke2(_ sender: Any) {
        guard let nextVC2 = self.storyboard?.instantiateViewController(identifier: "TextFieldDelegateViewController") as? TextFieldDelegateViewController else{return}
        self.navigationController?.pushViewController(nextVC2, animated: true)
    }
    @objc func dataReceived(notification : NSNotification){
        if let text = notification.object as? String{
            mainLabel.text = text
        }
    }
}
