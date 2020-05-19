//
//  LoversData.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/4/29.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import Foundation
import Combine

class LoversData: ObservableObject {
    @Published var lovers = [Lover]()
    var cancellable: AnyCancellable?
    init() {
        if let data = UserDefaults.standard.data(forKey: "lovers") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Lover].self, from: data) {
                lovers = decodedData
            }
        }
        
        
        cancellable = $lovers
            .sink { (value) in
                let encoder = JSONEncoder()
                do {
                    let data = try encoder.encode(value)
                    UserDefaults.standard.set(data, forKey: "lovers")
                } catch {
                    
                }
        }
        
    }
}
