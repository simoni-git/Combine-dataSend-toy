//
//  정리.swift
//  practice
//
//  Created by 시모니 on 12/7/23.
//

import Foundation
/*
 
 순서
 1. 텍스트필드에 값을 입력하게됨
 2. assign 을 통해 값이 mainvc 에 있는 변수에 전달됨.
 3. 텍스트필드에 값을 입력하고나서 버튼을 누르면 mainvc에 있는 데이터를 배열에 저장하고 뷰를 이동시킴
 4. viewWillAppear 이 실행됨
 5. deinit 이 실행됨
 
 
 알게된점
 여태까지 8번의 시도를 하면서 데이터가 mainvc 에 전달되는것 까지는 성공했으나,
 뷰가 이동하게되면 값이 남아있지 않는현상이 고쳐지지않았음.
 그래서 secondVC 에서 mainvc 를 사용할때 새로운 인스턴스를 생성하는것이 아닌 기존에있는 mainvc 의 인스턴스를
 사용하게되었더니 문제가 해결됨.
 */
