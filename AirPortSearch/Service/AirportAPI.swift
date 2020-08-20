//
//  AirportAPI.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/19.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import RxSwift

protocol AirportAPI {
    func fetchAirport() -> Single<AirportResponse>
}

