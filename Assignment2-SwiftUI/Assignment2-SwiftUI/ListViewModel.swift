//
//  ListViewModel.swift
//  Assignment2-SwiftUI
//
//  Created by Nguyen Anh Tu on 7/9/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import Foundation
import RxSwift
import Combine
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class ListViewModel : ObservableObject {
        static let shared = ListViewModel()
    public let didChange = PassthroughSubject<ListViewModel, Never>()
    @Published var data = [HomeListModel]() {
        didSet {
            didChange.send(self)
        }
    }

    init() {
        getList(limit: 10, offset: 1)
    }
    
    var signalPush: PublishSubject<Bool> = PublishSubject<Bool>()
    func getList(limit: Int, offset: Int) {
        Alamofire.request("https://rtlab02.rtworkspace.com/api/query/datamodel?dm_name=test_ucdp_ged181&token=secret&limit=\(limit)&offset=1").responseArray { (response: DataResponse<[HomeListModel]>) in
            let data = response.result.value
            if let data = data {
                self.data = data
                self.signalPush.onNext(true)
            }
        }
    }
}
