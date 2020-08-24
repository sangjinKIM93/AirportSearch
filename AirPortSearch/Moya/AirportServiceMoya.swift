//
//  AirportServiceMoya.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/20.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import RxSwift
import Moya

class AirportServiceMoya {
    
    static let shared: AirportServiceMoya = AirportServiceMoya()
    
    func fetchAirport() -> Single<[AirportModel]> {
        
        return Single.create { (single) -> Disposable in
            
            let provider = MoyaProvider<AirportApi>()
            provider.request(.getAirports) { result in
                switch result {
                case let .success(moyaResponse):
                    do {
                        let airportJSON = try JSONDecoder().decode([AirportModel].self, from: moyaResponse.data)
                        single(.success(airportJSON))
                        
                    } catch { }
                case let .failure(error):
                    print(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
}
