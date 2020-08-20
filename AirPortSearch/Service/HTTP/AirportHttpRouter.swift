//
//  AirportHttpRouter.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/19.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import Alamofire

enum AirportHttpRouter {
    case getAirports
}

extension AirportHttpRouter: HttpRouter {
    
    var baseUrlString: String {
        return "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588"
    }
    
    var path: String {
        switch self {
        case .getAirports:
            return "airports.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAirports:
            return .get
        }
    }


}
