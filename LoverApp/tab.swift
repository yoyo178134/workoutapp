//
//  tab.swift
//  LoverApp
//
//  Created by 郭垣佑 on 2020/5/19.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct tab: View {
    @ObservedObject var loversData = LoversData()
    var body: some View {
        TabView {
            LoverList(loversData: self.loversData).tabItem {
                Image(systemName: "heart")
                Text("WorkOut")
            }
            chartView(loversData: self.loversData).tabItem {
                Image(systemName: "chart.pie.fill")
                Text("Chart")
            }
        }
    }
}

struct tab_Previews: PreviewProvider {
    static var previews: some View {
        tab()
    }
}
