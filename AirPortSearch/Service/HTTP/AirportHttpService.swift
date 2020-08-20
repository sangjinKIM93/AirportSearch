//
//  AirportHttpService.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/19.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import Alamofire

class AirportHttpService: HttpService {
    
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
}
