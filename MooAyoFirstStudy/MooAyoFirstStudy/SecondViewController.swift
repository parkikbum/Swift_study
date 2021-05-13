import UIKit

protocol MyProtocol {
}

class SecondViewController: UIViewController{
    @IBOutlet weak var textLable: UILabel!
    var text : String = ""
    @IBOutlet weak var dataTextfield: UITextField!
    var mainVC : MainViewController?

   
    var delegate: MyProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textLable.text = text
    }
    @IBAction func ButtonClicked(_ sender: Any) {
        mainVC?.onSecondVCAction(data: self.dataTextfield.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }

    
 }
