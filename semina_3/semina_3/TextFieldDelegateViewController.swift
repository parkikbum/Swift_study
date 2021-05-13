//
//  TextFieldDelegateViewController.swift
//  semina_3
//
//  Created by 박익범 on 2021/04/24.
//

import UIKit

class TextFieldDelegateViewController: UIViewController {
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textFieldDelegateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField2.delegate = self
        
    }
   
}
extension TextFieldDelegateViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldDelegateLabel.text = textField2.text
        return true
    }
    
}
