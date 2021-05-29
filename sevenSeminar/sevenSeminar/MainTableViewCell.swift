//
//  MainTableViewCell.swift
//  sevenSeminar
//
//  Created by 박익범 on 2021/05/29.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    static let identifier : String = "MainTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(data : String){
        mainLabel.text = data
    }

}
