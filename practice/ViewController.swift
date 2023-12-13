//
//  ViewController.swift
//  practice
//
//  Created by 시모니 on 12/6/23.
//

import UIKit
import Combine

class ViewController: UIViewController {

    var viewmodel: ViewModel!
    
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.dataSource = self
        tabelView.delegate = self
        viewmodel = ViewModel()
        print("몇번생기나보자")
        
    }
    @IBAction func tapAddBtn(_ sender: UIBarButtonItem) {
        
        let VC = storyboard!.instantiateViewController(identifier: "secondViewController") as! secondViewController
        VC.viewmodel = self.viewmodel
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabelView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? myCell else {
            return UITableViewCell()
        }
        let data = viewmodel.myArray[indexPath.row]
        cell.myLabel.text = data
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

class myCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
}

