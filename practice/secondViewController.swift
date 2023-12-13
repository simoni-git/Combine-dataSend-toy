//
//  secondViewController.swift
//  practice
//
//  Created by 시모니 on 12/6/23.
//

import UIKit
import Combine

class secondViewController: UIViewController {
    
    var viewmodel: ViewModel!
    var bag = Set<AnyCancellable>()
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textField
            .myPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.data, on: viewmodel)
            .store(in: &bag)
    }
    
    @IBAction func tapBtn(_ sender: UIButton) {

        viewmodel.appendData()
        self.navigationController!.popToRootViewController(animated: true)
    }
    

}

extension UITextField {
    var myPublisher: AnyPublisher<String , Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap{$0.object as? UITextField}
            .compactMap{$0.text ?? ""}
            .eraseToAnyPublisher()
    }
}
