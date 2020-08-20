//
//  AirportApi.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/20.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import Foundation
import Moya

public enum AirportApi {
    
    case getAirports
    
}

extension AirportApi : TargetType {
    public var baseURL: URL {
        return URL(string: "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/")!
    }
    
    public var path: String {
        switch self {
        case .getAirports:
            return "airports.json"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
