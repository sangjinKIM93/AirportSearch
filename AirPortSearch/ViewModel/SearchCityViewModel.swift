//
//  SearchCityViewModel.swift
//  AirPortSearch
//
//  Created by 김상진 on 2020/08/18.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import RxCocoa

protocol SearchCityViewPresentable {
    //정확히는 모르겠지만 korbit에 되어 있는 것과 비슷한 개념인듯
    //특이한점은 tuple형태로 관리한다는 점. (왜 그럴까?)
    typealias Input = (
        searchText: Driver<String>, ()
    )
    typealias Output = ()
    //얘는 클로저임
    typealias ViewModelBuilder = (SearchCityViewPresentable.Input) -> SearchCityViewPresentable
    
    //핵심은 input,output으로 직관적으로 흐름을 관리하는 것이다.
    //단 그 타입을 typealias를 통해서 쉽게 변경 가능하도록 한 것이다.
    var input: SearchCityViewPresentable.Input { get }
    var output: SearchCityViewPresentable.Output { get }
}

class SearchCityViewModel : SearchCityViewPresentable {
    
    var input: SearchCityViewPresentable.Input
    var output: SearchCityViewPresentable.Output
    
    init(input: SearchCityViewPresentable.Input) {
        self.input = input
        //얘를 함수로 만든 이유는 좀 더 보면 알 수 있을듯. 아마 메서드로 넣어줄 일이 자주 있는 듯
        self.output = SearchCityViewModel.output(input: self.input)
    }
    
}

extension SearchCityViewModel {
    
    static func output(input: SearchCityViewPresentable.Input) -> SearchCityViewPresentable.Output {
        //뭔가 작업을 해줘야하지않아?
        //아직 안 한듯
        return ()
    }
    
}
