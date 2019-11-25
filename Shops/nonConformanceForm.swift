//
//  CostCenterView.swift
//  Shops
//
//  Created by Matthew  Martin on 11/8/19.
//  Copyright © 2019 AerospaceCoatings. All rights reserved.
//

import SwiftUI



struct nonConformanceForm: View {
    
     var categories = ["Category 1", "Category 2 ", "Category 3"]

      @State var categoryIndex: Int = 0
      @State var visible = true
    
    var body: some View {
        VStack{
            NavigationView {
                Form {
                   Section {
                        Picker(selection: $categoryIndex, label: Text("Non-Conformance Category")) {
                            ForEach(0 ..< categories.count) {
                                Button(self.categories[$0]){
                                   
                                }
                            }
                        }.foregroundColor(Color.black)
                         
                   }
                    
                    visible ? Section(header: Text("Prototype Cells")) {
                        List{
                            HStack{
                                Text("test")
                                Spacer()
                            }.padding()
                        }
                    } : nil
                    
                    
                }.navigationBarTitle(Text("Non-Conformance"))
               
            }.navigationViewStyle(StackNavigationViewStyle())
          

        }
     }
    }
        
struct nonConformanceForm_Previews: PreviewProvider {
    static var previews: some View {
        nonConformanceForm()
    }
}

