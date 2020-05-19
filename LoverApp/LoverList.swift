//
//  LoverList.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/4/29.
//  Copyright © 2020 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct LoverList: View {
    
    @ObservedObject var loversData = LoversData()
    @State private var showEditLover = false
    @State private var showresult = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(loversData.lovers) { (lover) in
                    NavigationLink(destination: LoverEditor(loversData: self.loversData, editLover: lover)) {
                        LoverRow(lover: lover)
                        
                    }
                    
                }
                .onDelete { (indexSet) in
                    self.loversData.lovers.remove(atOffsets: indexSet)
                }
                
                
                
            }
            .navigationBarTitle("訓練列表")
                
            .navigationBarItems(leading: EditButton(),trailing: Button(action: {
                self.showEditLover = true
            }, label: {
                Image(systemName: "plus.circle.fill")
            }))
                .sheet(isPresented: $showEditLover) {
                    NavigationView {
                        LoverEditor(loversData: self.loversData)
                    }
            }
            
            
        }
        
        
        
    }
}

struct LoverList_Previews: PreviewProvider {
    static var previews: some View {
        LoverList()
    }
}
