//
//  ViewModel.swift
//  practice
//
//  Created by 시모니 on 12/12/23.
//

import Foundation

 class ViewModel {
    
    var data = "" {
        didSet {
            print("data1에 값이 들어왔다. 들어온 데이터는 --> \(data)")
        }
    }
    
    var myArray: [String] = [] {
        didSet {
            print("배열에 값이 추가되었다. 배열의 아이템갯수는 --> \(myArray.count)")
        }
    }
    
    func appendData() {
        self.myArray.append(data)
    }
    
}
