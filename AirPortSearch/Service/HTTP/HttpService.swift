//
//  HTTPService.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/19.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import Alamofire

//** 실제 요청을 수행
protocol HttpService {
    var sessionManager: Session { get set } //session이란 요청 타입이야.
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
