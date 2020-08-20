//
//  AppCoordinator.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/18.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        
        let navigationBar = navigationController.navigationBar
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = UIColor.systemOrange
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 28), .foregroundColor: UIColor.white]
        navigationBar.isTranslucent = false
        
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        
        //다음 화면의 coordinator를 생성하고 childCoordinator에 추가한다. 그리고 start()
        let searchCityCoordinator = SearchCityCoordinator(navigationController: navigationController)
        self.add(coordinator: searchCityCoordinator)
        searchCityCoordinator.start()
        
        //navigationController가 기준점이 된다.
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
