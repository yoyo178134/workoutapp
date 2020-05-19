//
//  LoverRow.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/4/29.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct LoverRow: View {
    var lover: Lover

    var body: some View {
        HStack {
            Text(lover.name)
            Spacer()
            Text("\(lover.type)")
            Text("\(lover.weight) kg")
            Text("\(lover.set) sets")
            
        }

    }
}

struct LoverRow_Previews: PreviewProvider {
    static var previews: some View {
        LoverRow(lover: Lover(name: "Penny", weight: 45, set: 0, workoutdate: "12",type: "肩"))
    }
}
