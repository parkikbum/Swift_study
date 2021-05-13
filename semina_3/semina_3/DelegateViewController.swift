//
//  DelegateViewController.swift
//  semina_3
//
//  Created by 박익범 on 2021/04/24.
//

import UIKit
protocol sampleProtocol {
    func dataSend(data : String)
}

class DelegateViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var delegate : sampleProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func dataSendButtonClicked(_ sender: Any) {
        if let text = textField.text{
            NotificationCenter.default.post(name: NSNotification.Name("sample"), object: text)
            //delegate?.dataSend(data: text)
            
        }
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
