//
//  TabbarView.swift
//  Assignment2-SwiftUI
//
//  Created by Nguyen Anh Tu on 7/10/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }) {
                HStack {
                    Image(systemName: "list.dash")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 35, height: 30)
                    Text(self.index == 0 ? "List" : "")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }.padding(15)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .background(self.index == 0 ? Color.blue.opacity(0.5) : Color.clear)
                    .clipShape(Capsule())
            }
            Spacer(minLength: 0)
            Button(action: {
                self.index = 1
            }) {
                HStack {
                    Image(systemName: "map.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 35, height: 30)
                    Text(self.index == 1 ? "Map" : "")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }.padding(15)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .background(self.index == 1 ? Color.green.opacity(0.5) : Color.clear)
                    .clipShape(Capsule())
            }
        }.frame(width: UIScreen.main.bounds.width)
            .animation(.easeInOut(duration: 0.1))
    }
}
