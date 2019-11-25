//
//  scanLocationsModal.swift
//  Shops
//
//  Created by Matthew  Martin on 11/8/19.
//  Copyright © 2019 AerospaceCoatings. All rights reserved.
//

import SwiftUI



struct scanLocationsModal: View {
    
   
    var body: some View {
          
       VStack{
               Text("Scan Locations").padding().foregroundColor(Color.white)
               List{
                   HStack{
                       Text("test")
                       Spacer()
                   }.padding()
               }
           }.background(Color.black).edgesIgnoringSafeArea(.vertical)
        
                   
     }
}
        
struct scanLocationsModal_Previews: PreviewProvider {
    static var previews: some View {
        scanLocationsModal()
    }
}

