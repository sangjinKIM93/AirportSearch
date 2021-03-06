//
//  SearchCityViewModel.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/18.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import RxSwift
import RxCocoa
import RxRelay

protocol SearchCityViewPresentable {
    //정확히는 모르겠지만 korbit에 되어 있는 것과 비슷한 개념인듯
    //특이한점은 tuple형태로 관리한다는 점. (왜 그럴까?)
    typealias Input = (
        searchText: Driver<String>, ()
    )
    typealias Output = ()
    //얘는 클로저임
    typealias ViewModelBuilder = (SearchCityViewPresentable.Input) -> SearchCityViewPresentable
    
    //핵심은 input,output을 활용해 직관적으로 흐름을 관리하는 것이다.
    //단 그 타입을 typealias를 통해서 쉽게 변경 가능하도록 한 것이다.
    var input: SearchCityViewPresentable.Input { get }
    var output: SearchCityViewPresentable.Output { get }
}

class SearchCityViewModel : SearchCityViewPresentable {
    
    var input: SearchCityViewPresentable.Input
    var output: SearchCityViewPresentable.Output
    private let airportService: AirportServiceMoya
    
    typealias State = (airports: BehaviorRelay<Set<AirportModel>>, ())
    private let state: State = (airports: BehaviorRelay<Set<AirportModel>>(value: []), ())
    
    
    private let bag = DisposeBag()
    
    init(input: SearchCityViewPresentable.Input, airportService: AirportServiceMoya) {
        self.input = input
        //얘를 함수로 만든 이유는 좀 더 보면 알 수 있을듯. 아마 메서드로 넣어줄 일이 자주 있는 듯
        self.output = SearchCityViewModel.output(input: self.input, state: self.state, bag: self.bag)
        self.airportService = airportService
        self.process()
    }
    
}

extension SearchCityViewModel {
    
    static func output(input: SearchCityViewPresentable.Input,
                       state: State,
                       bag: DisposeBag) -> SearchCityViewPresentable.Output {
        
        //output에서 input이 달라지는 경우, state가 달라지는 경우를 합침
        let searchTextObservable = input.searchText
            .debounce(.milliseconds(300))
            .distinctUntilChanged()
            .skip(1)
            .asObservable()
            .share(replay: 1, scope: .whileConnected)
        
        let airportsObservable = state.airports
            .skip(1)
            .asObservable()
        
        Observable
            .combineLatest(
                searchTextObservable,
                airportsObservable
            )
            .map({ (searchKey, airports) in
                return airports.filter { (airport) -> Bool in
                    !searchKey.isEmpty && airport.city.lowercased()
                        .lowercased()
                        .replacingOccurrences(of: " ", with: "")
                        .hasPrefix(searchKey.lowercased())
                }
            })
            .map {
                print($0)
            }
            .subscribe()
            .disposed(by: bag)
            
        
        return ()
    }
    
    //AirportService를 활용해서 데이터를 가져오는 함수. => state 최신화
    func process() -> Void {
        self.airportService
            .fetchAirport()
            .map({ Set($0) })
            .map({ [state] in state.airports.accept($0) })
            .subscribe()
            .disposed(by: bag)
    }
    
}
