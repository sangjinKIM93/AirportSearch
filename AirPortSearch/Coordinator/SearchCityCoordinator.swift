//
//  SearchCityCoordinator.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/18.
//  Copyright © 2020 kipCalm. All rights reserved.
//
import UIKit

class SearchCityCoordinator : BaseCoordinator{
    
    //navigationController가 있어야 push를 하겠지?
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        
        //storybordable을 채택했기에 가능함.
        let view = SearchCityViewController.instantiate()
        
        //viewModelBuilder로 viewmodel을 생성.
        //viewModelBuilder는 closure이기 때문에 아래와 같은 식으로 사용 가능
        view.viewModelBuilder = {
            SearchCityViewModel(input: $0)
        }
        
        navigationController.pushViewController(view, animated: true)
    }
}
