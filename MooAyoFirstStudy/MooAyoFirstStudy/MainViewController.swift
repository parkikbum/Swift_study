import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var propertyTextField: UITextField!
    @IBOutlet weak var segueTextField: UITextField!
    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var delegationTextField: UITextField!
    @IBOutlet weak var delegateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegationTextField.delegate = self
    }
   @IBAction func propertyButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else{return}
        vc.text = self.propertyTextField.text ?? ""
        self.present(vc, animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is SecondViewController{
            let vc = segue.destination as? SecondViewController
            vc?.text = segueTextField.text ?? ""
            
            // destination = 전환하고자 하는 도착점에 해당하는 뷰 컨트롤러
            // 여기선 secondviewController에 도착하면 vc.text의 값을 segueTextField.text의 값으로 하자고 한거!!
        }
    }
    func onSecondVCAction(data: String){
        self.propertyLabel.text = data
    }
    @IBAction func Third(_ sender: Any) {
        guard let vc2 = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {return}
        vc2.mainVC = self
        self.navigationController!.pushViewController(vc2, animated: true)
    }
   /* @IBAction func fourth(_ sender: Any) {
        delegateLabel.text = delegationTextField.text
    }*/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegateLabel.text = delegationTextField.text
        return true
    }
}
