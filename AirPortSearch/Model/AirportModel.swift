//
//  AirportModel.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/19.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import Foundation

// MARK: - WelcomeElement
struct AirportResponse: Codable {
    let data: [AirportModel]
}

struct AirportModel: Codable {
    let code, lat, lon, name: String?
    let state, country, woeid: String?
    let tz, phone, type, email: String?
    let url, runwayLength, elev, icao: String?
    let directFlights, carriers: String?
    let city: String

    enum CodingKeys: String, CodingKey {
        case code, lat, lon, name, city, state, country, woeid, tz, phone, type, email, url
        case runwayLength = "runway_length"
        case elev, icao
        case directFlights = "direct_flights"
        case carriers
    }
}

//Equatable, Hashable을 추가적으로 채택해주자
extension AirportModel: Equatable {
    static func == (lhs: AirportModel, rhs: AirportModel) -> Bool {
        return lhs.code == rhs.code
    }
}

extension AirportModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
}
