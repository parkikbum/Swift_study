import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var strikeLabel: UILabel!
    @IBOutlet weak var ballLabel: UILabel!
    @IBOutlet weak var outLabel: UILabel!
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var warningLabel: UILabel!

    @IBOutlet weak var labelCount: UILabel!
    var count : Int = 1
    var userNumber : [Any] = []
    var number = [Int(arc4random_uniform(9)), Int(arc4random_uniform(9)),Int(arc4random_uniform(9))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillAppear(true)
        labelCount.text = String(count)
    }
    override func viewWillAppear(_ animated: Bool) {
        labelCount.text = String(count)
    }
    @IBAction func attack(_ sender: Any) {
        if userTextfield.text == ""{
            warningLabel.text = "숫자를 입력해주세요"
        }
        else{
            if count != 9{
                userNumber.append(userTextfield.text?.split(separator: " "))
                print(userNumber)
                
            }
            else{
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
   
    
}
