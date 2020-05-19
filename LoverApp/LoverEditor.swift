//
//  LoverEditor.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/4/29.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import SwiftUI



struct LoverEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var loversData: LoversData
    @State private var name = ""
    @State private var weight = 5
    @State private var set = 1
    @State private var workoutdate = Date()
    @State private var type = ""
    var editLover: Lover?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter
    }()
    
    var roles = ["肩","手","胸","背","腿"]
    
    var body: some View {
        
        
            Form {
                TextField("運動名稱", text: $name)
                Stepper("重量 \(weight)", value: $weight, in: 5...100,step: 5)
                Stepper("組數 \(set)", value: $set, in: 1...10,step: 1)
                DatePicker("日期", selection: $workoutdate, displayedComponents: .date)
                Picker(selection: self.$type, label: Text("部位")) {
                    ForEach(self.roles, id: \.self) { (role) in
                        Text(role)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            .navigationBarTitle("訓練")
            .navigationBarItems(trailing: Button("Save") {
                
                let lover = Lover(name: self.name, weight: self.weight, set: self.set,workoutdate: self.dateFormatter.string(from: self.workoutdate),type: self.type)
                
                if let editLover = self.editLover {
                    let index = self.loversData.lovers.firstIndex {
                        $0.id == editLover.id
                    }!
                    self.loversData.lovers[index] = lover
                } else {
                    self.loversData.lovers.insert(lover, at: 0)
                }

                
                self.presentationMode.wrappedValue.dismiss()
            })
                .onAppear {
                    
                    if let editLover = self.editLover {
                        self.name = editLover.name
                        self.weight = editLover.weight
                        self.set = editLover.set
                        self.workoutdate = self.dateFormatter.date(from:editLover.workoutdate)!
                        self.type = editLover.type
                    }
        }
        
    }

}

struct LoverEditor_Previews: PreviewProvider {
    static var previews: some View {
        LoverEditor(loversData: LoversData())
    }
}
