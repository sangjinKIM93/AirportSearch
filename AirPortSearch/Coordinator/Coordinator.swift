//
//  Coordinator.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/18.
//  Copyright © 2020 kipCalm. All rights reserved.
//


protocol Coordinator: class {  //프로토콜을 클래스에서만 사용 가능하도록 선언. mutating없이 변수 조작이 가능하다.
    
    var childCoordinators: [Coordinator] { get set }
    
    //이 친구가 해당 view를 시작시키지.
    func start()
}

extension Coordinator {
    
    func add(coordinator: Coordinator) -> Void {
        childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: Coordinator) -> Void {
        childCoordinators = childCoordinators.filter({ $0 !==  coordinator  })
    }
    
}
