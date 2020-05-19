//
//  chartView.swift
//  LoverApp
//
//  Created by 郭垣佑 on 2020/5/19.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct chartView: View {
    @ObservedObject var loversData = LoversData()
    
    var totalAmount:Double = 0
    var index:Double = 0
    var countAmount:[Double] = [0, 0, 0, 0, 0]
    var percentAmount:[Double] = [0, 0, 0, 0, 0]
    var countType:[Int] = [0, 0, 0, 0, 0]
    
    var anglesAmount = [Angle]()
    var startDegree: Double = 0
    var anglesAmount2 = [Angle]()
    var startDegree2: Double = 0
    var percentAmount2:[Double] = [0, 0, 0, 0, 0]

    
    let types = ["肩","手","胸","背","腿"]
    
    init(loversData: LoversData) {
        for data in loversData.lovers {
            index += 1;
            let tmp = Double(data.set*data.weight)
            totalAmount += tmp
            if data.type == "肩" {
                countAmount[0] += tmp 
                countType[0] += 1;
            } else if data.type == "手" {
                countAmount[1] += tmp
                countType[1] += 1;
            } else if data.type == "胸" {
                countAmount[2] += tmp
                countType[2] += 1;
            } else if data.type == "背" {
                countAmount[3] += tmp
                countType[3] += 1;
            } else {
                countAmount[4] += tmp
                countType[4] += 1;
            }
        }
        
        percentAmount[0] = countAmount[0] / totalAmount
        percentAmount[1] = countAmount[1] / totalAmount
        percentAmount[2] = countAmount[2] / totalAmount
        percentAmount[3] = countAmount[3] / totalAmount
        percentAmount[4] = countAmount[4] / totalAmount
        
        for percent in percentAmount {
            anglesAmount.append(.degrees(startDegree))
            startDegree += 360 * percent
        }
        
        percentAmount2[0] = Double(countType[0]) / index
        percentAmount2[1] = Double(countType[1]) / index
        percentAmount2[2] = Double(countType[2]) / index
        percentAmount2[3] = Double(countType[3]) / index
        percentAmount2[4] = Double(countType[4]) / index
        
        for percent in percentAmount2 {
            anglesAmount2.append(.degrees(startDegree))
            startDegree += 360 * percent
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    PieChartView(startAngle: anglesAmount)
                        .frame(width: 180, height: 180)
                    Spacer()
                    VStack(alignment: .trailing){
                        Color.blue.frame(width: 10, height: 10)
                        Text("肩" + String(format: "%.1f", percentAmount[0] * 100) + "%")
                        Color.green.frame(width: 10, height: 10)
                        Text("手" + String(format: "%.1f", percentAmount[1] * 100) + "%")
                        Color.yellow.frame(width: 10, height: 10)
                        Text("胸" + String(format: "%.1f", percentAmount[2] * 100) + "%")
                        Color.red.frame(width: 10, height: 10)
                        Text("背" + String(format: "%.1f", percentAmount[3] * 100) + "%")
                        Color.orange.frame(width: 10, height: 10)
                        Text("腿" + String(format: "%.1f", percentAmount[4] * 100) + "%")
                    }
                }
                .padding()
                
                
                HStack {
                    PieChartView(startAngle: anglesAmount2)
                        .frame(width: 180, height: 180)
                    Spacer()
                    VStack(alignment: .trailing){
                        Color.blue.frame(width: 10, height: 10)
                        Text("肩" + String(format: "%d", countType[0] ) + "次/天")
                        Color.green.frame(width: 10, height: 10)
                        Text("手" + String(format: "%d", countType[1] ) + "次/天")
                        Color.yellow.frame(width: 10, height: 10)
                        Text("胸" + String(format: "%d", countType[2] ) + "次/天")
                        Color.red.frame(width: 10, height: 10)
                        Text("背" + String(format: "%d", countType[3] ) + "次/天")
                        Color.orange.frame(width: 10, height: 10)
                        Text("腿" + String(format: "%d", countType[4] ) + "次/天")
                    }
                }
                .padding()
                Spacer()
            }
            .navigationBarTitle("圖表統計")
        }
    }
}

struct chartView_Previews: PreviewProvider {
    static var previews: some View {
        chartView(loversData: LoversData())
    }
}




