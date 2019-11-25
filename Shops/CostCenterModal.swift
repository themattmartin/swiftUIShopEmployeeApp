//
//  CostCenterView.swift
//  Shops
//
//  Created by Matthew  Martin on 11/8/19.
//  Copyright © 2019 AerospaceCoatings. All rights reserved.
//

import SwiftUI



struct CostCenterModal: View {
    
    //@Binding var CCenterModal: Bool
    @State private var taskIndex = 0
    
    var task = ["Grind","LG", "Preinspection"]
    @State var name: String = ""
    @State private var taskChoice = 0
    
    var body: some View {
        VStack{
            Text("Cost Center").padding().foregroundColor(Color.white)
            List{
                HStack{
                    Text("test")
                    Spacer()
                }.padding()
            }
        }.background(Color.black).edgesIgnoringSafeArea(.vertical)
     }
}
        
struct CostCenterModal_Previews: PreviewProvider {
    static var previews: some View {
        CostCenterModal()
    }
}

