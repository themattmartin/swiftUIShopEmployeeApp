//
//  ContentView.swift
//  Shops
//
//  Created by Matthew  Martin on 11/8/19.
//  Copyright © 2019 AerospaceCoatings. All rights reserved.
//

import SwiftUI



struct ScanningModalView: View {
    //@Binding var showModal: Bool
    @State private var CCenterModal = false
    @State private var pLocationModal = false
    @State private var cLocationModal = false
    @State private var taskCompleted = false
    @State private var taskIndex = 0
    
    
    //var task = ["Grind","LG", "Preinspection"]
    @State var name: String = ""
    var body: some View {
        
        VStack {
            HStack{
                Image(systemName: "chevron.down")
                    .foregroundColor(Color.blue)
                Button("Cancel") {
                        //ScanningModalView = false
                    }
                .foregroundColor(Color.blue)
                .font(.system(size: 16))
                
                Spacer()
            }.padding()
            List{
                
                    HStack{
                        Text("Select Task Completed")
                        Spacer()
                        Image(systemName: "chevron.up")
                        Button("") {
                            self.taskCompleted = true
                              }.sheet(isPresented: $taskCompleted) {
                                 scanLocationsModal()
                              }
                    }
                    .padding()
                    
                    
                    
                    HStack{
                        Text("Cost Center")
                        Spacer()
                        Image(systemName: "chevron.up")
                        Button("") {
                            self.CCenterModal = true
                        }.sheet(isPresented: $CCenterModal) {
                            CostCenterModal()
                        }
                    }.padding()
                        
                
                    
                    HStack{
                        
                        Text("Parent Location")
                        Spacer()
                        Image(systemName: "chevron.up")
                        Button("") {
                            self.pLocationModal =  true
                              }.sheet(isPresented: $pLocationModal) {
                                  ParentLocationModal()
                              }
                    }.padding()
                    
                    
                    
                    HStack{
                        Text("Child Location")
                        Spacer()
                        Image(systemName: "chevron.up")
                        Button("") {
                            self.cLocationModal =  true

                              }.sheet(isPresented: $cLocationModal) {
                                  ChildLocationModal()
                              }
                    }.padding()
                    
            }
                    
                    VStack{
                        Text("Internal Memo")
                            .font(.headline)
                        TextField("Enter some text.", text: $name)
                            .frame(height: 200).padding()
                    }.padding()
                
            
            
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ScanningModalView()
    }
}
