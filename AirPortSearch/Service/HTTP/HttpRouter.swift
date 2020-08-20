//
//  HttpRouter.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/19.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import Alamofire

//** Router는 요청 정보를 정의
protocol HttpRouter {
    var baseUrlString: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    func body() throws -> Data?
    
    func requset(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {
    
    //default 값 설정 -> 이걸 해줘야 채택시 해당 파라미터 및 메서드를 안 가져와도 문제가 없음
    var parameters: Parameters? { return nil }
    func body() throws -> Data? { return nil }
    var headers: HTTPHeaders? { return nil }
    
    func asUrlRequest() throws -> URLRequest {
        var url = try baseUrlString.asURL()
        url.appendPathComponent(path)
        
        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        
        return request
    }   //URLRequest는 요청을 직접 수행하는 것은 아니고 그 정보만 나타낸다. 이 정보를 활용해서 request를 보내는 것.
    
    func requset(usingHttpService service: HttpService) throws -> DataRequest {
        return try service.request(asUrlRequest())
    }    //dataRequest는 정확히는 모르겠지만 좀 더 넓은 의미인듯.
}
