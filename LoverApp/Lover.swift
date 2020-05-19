//
//  Lover.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/4/29.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import Foundation

struct Lover: Identifiable, Codable {
    let id = UUID()
    var name: String
    var weight: Int
    var set: Int
    var workoutdate: String
    var type: String
   
}
