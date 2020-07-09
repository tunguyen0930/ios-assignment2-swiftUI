//
//  ContentView.swift
//  Assignment2-SwiftUI
//
//  Created by Nguyen Anh Tu on 7/9/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                ListView()
                Spacer()
                TabbarView(index: self.$index)
            }
        }
    }
}
