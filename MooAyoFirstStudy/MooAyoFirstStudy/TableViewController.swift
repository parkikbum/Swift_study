//
//  TableViewController.swift
//  MooAyoFirstStudy
//
//  Created by 박익범 on 2021/04/21.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableview_cell") else {
            fatalError("셀이 존재하지 않습니다.")
        }
        cell.textLabel?.text = self.tableArray[indexPath.row]
        return cell
    }
    
    
    let tableArray:[String] = ["A","B","C","D","E"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}
