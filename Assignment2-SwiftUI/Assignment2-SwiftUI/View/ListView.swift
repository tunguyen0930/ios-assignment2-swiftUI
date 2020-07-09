//
//  ListView.swift
//  Assignment2-SwiftUI
//
//  Created by Nguyen Anh Tu on 7/10/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import SwiftUI
import RxSwift

struct ListView: View {
    @State var viewModel = ListViewModel()
    @State var model = [HomeListModel]()
    
    var body: some View {
        List (self.model, id: \.id) { model in
            VStack (alignment:.leading,spacing: 10) {
                Text("\(model.country ?? "")")
                Text("\(model.region ?? "")")
            }
        }.onAppear{
            self.viewModel.getList(limit: 10, offset: 1)
            self.viewModel.signalPush.subscribe(onNext : {event in
                if event {
                    self.model = self.viewModel.data
                }
            })
        }
    }
}
