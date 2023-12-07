//
//  secondViewController.swift
//  practice
//
//  Created by 시모니 on 12/6/23.
//

import UIKit
import Combine

class secondViewController: UIViewController {

    var bag = Set<AnyCancellable>()
    var mainVC: ViewController!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mainVC = ViewController()
        
        //⬇️ 내가 7트동안 안되고있던 이유는? mainVC 의 인스턴스를 새로 생성해서 거기에대가 할당을했는데, 항상 새로 생성하면 값이 사라지기때문에, 기존에있던 mainVC 인스턴스를 사용한다고 적용해줘야 값이 저장이됨.
        
        // 기존의 ViewController 인스턴스를 사용하도록 수정
        if let existingMainVC = navigationController?.viewControllers.first as? ViewController {
            mainVC = existingMainVC
            
            
            textField
                .muyPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.myStringData, on: mainVC)
                .store(in: &bag)
            
            
        }
    }
    
    @IBAction func tapBtn(_ sender: UIButton) {
        
        guard let data = textField.text else {return}
        mainVC.myArray.append(data)
        
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    deinit {
        
              bag.forEach { $0.cancel() }
              print("deinit 발동")
          }
    }
    



extension UITextField {
    var muyPublisher: AnyPublisher<String , Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap{$0.object as? UITextField}
            .map{$0.text ?? ""}
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
