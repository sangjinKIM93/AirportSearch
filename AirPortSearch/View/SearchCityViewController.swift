//
//  ViewController.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/18.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import UIKit
import RxSwift

class SearchCityViewController: UIViewController {
    
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SearchCityViewPresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

