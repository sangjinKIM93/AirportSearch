//
//  AirportService.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/19.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import RxSwift

class AirportService {
    
    private lazy var httpService = AirportHttpService()
    //singleton 패턴으로
    static let shared: AirportService = AirportService()
}

extension AirportService: AirportAPI {
    func fetchAirport() -> Single<AirportResponse> {
        
        return Single.create { [httpService] (single) -> Disposable in
            
            do {
                try AirportHttpRouter.getAirports
                    .requset(usingHttpService: httpService)
                    .responseJSON { (result) in
                    
                    //디버깅으로 알 수 있는 것은 얘가 nil 이라는 것이야.
                    guard let data = result.data else { return }
                    
                    do {
                        let airports = try JSONDecoder().decode(AirportResponse.self, from: data)
                        single(.success(airports))
                    } catch { }
                }
            } catch { }
            
            return Disposables.create()
        }
    }
    
    
}
