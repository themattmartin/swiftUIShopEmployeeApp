//
//  ParentLocationModal.swift
//  Shops
//
//  Created by Matthew  Martin on 11/8/19.
//  Copyright © 2019 AerospaceCoatings. All rights reserved.
//

import SwiftUI



struct ParentLocationModal: View {
    
   
    var body: some View {
          
        VStack{
               Text("Parent Location").padding().foregroundColor(Color.white)
               List{
                   HStack{
                       Text("test")
                       Spacer()
                   }.padding()
               }
           }.background(Color.black).edgesIgnoringSafeArea(.vertical)
        
                   
     }
}
        
struct ParentLocationModal_Previews: PreviewProvider {
    static var previews: some View {
        ParentLocationModal()
    }
}

