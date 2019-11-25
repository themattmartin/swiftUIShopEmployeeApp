//
//  workView.swift
//  Shops
//
//  Created by Matthew  Martin on 11/18/19.
//  Copyright © 2019 AerospaceCoatings. All rights reserved.
//

import SwiftUI

struct StopWatchButton : View {
     var actions: [() -> Void]
     var labels: [String]
    
     @State var color: [Color]
     @State var bgColor: [String]
     @State var isPaused: Bool
    
    var body: some View {
        let buttonWidth = (UIScreen.main.bounds.size.width / 2)
        
        return Button(action: {
            if self.isPaused {
                self.isPaused =  false
                self.actions[0]()
            } else{
                self.isPaused = true
                self.actions[1]()
            }
        }) {
            if isPaused {
                HStack(spacing:0){
                    Text(self.labels[0])
                        .foregroundColor(Color.white)
                   
                    Image(systemName: "arrowtriangle.right.fill")
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top:0, leading :20, bottom:0, trailing:0))
                }.frame(width: buttonWidth, height: 50)
                 .padding()
                 .background(Color.orange)
                 .font(.system(size: 60))
                 .clipShape(RoundedRectangle(cornerRadius: 8))
                 .shadow(radius: 8)
                
            } else {
                HStack{
                    Text(self.labels[1])
                        .foregroundColor(Color.white)
                    
                    Image(systemName: "pause.fill")
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top:0, leading :20, bottom:0, trailing:0))
                    
            }.frame(width: buttonWidth, height: 50)
                    .padding()
                    .background(Color.gray)
                    .font(.system(size: 60))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 8)
                
            }
        }
        //.background(self.color)
    }
}

struct workView: View {
    
   // @State var count: Int = 0
    @ObservedObject var stopWatch = StopWatch()
    @State private var showModal = false
    
    var WorkOrder = "90878"
    var PartNumber = "9-087w=-w"
    var PartDescription = "bhfhqbfhbqhb"
    @State private var showPopover: Bool = false
    
    var body: some View {
        NavigationView{
            
            List{
                HStack{
                    Text("test")
                    Spacer()
                }.padding()
            }
        
        ZStack{
            Color( red: 67/255, green: 133/255, blue: 176/255)
            
            
        VStack(alignment:HorizontalAlignment.center, spacing:18){
            
            HStack(alignment: .top){
                
                Image("logo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:UIScreen.main.bounds.size.width / 2)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                    .background(Color.white)
               
            }
            HStack(spacing:20){
                VStack(spacing:0){
                    Text("Work Order:")
                        .foregroundColor(Color.white)
                        .font(.system(size: 30))
                        .padding(EdgeInsets(top: 35, leading: 10, bottom: 40, trailing: 10))
                        .frame(width:UIScreen.main.bounds.size.width / 4, height: 50).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    Text(self.WorkOrder)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30))
                        .padding(EdgeInsets(top: 35, leading: 10, bottom: 40, trailing: 10))
                        .frame(width:UIScreen.main.bounds.size.width / 4, height: 50)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10))
                    }.background(Color.gray)
                VStack(spacing: 0){
                    Text("Part Number:")
                        .foregroundColor(Color.white)
                        .font(.system(size: 30))
                        .frame(width:UIScreen.main.bounds.size.width / 4, height: 50).background(Color.gray).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    
                    Text(self.PartNumber)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30))
                        .padding(EdgeInsets(top: 35, leading: 10, bottom: 40, trailing: 10))
                        .frame(width:UIScreen.main.bounds.size.width / 4 , height: 50).padding(EdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10))
                }.background(Color.gray)
                
            }
            VStack(spacing:40){
                VStack(spacing:0){
                    Text("Part Description:")
                        .foregroundColor(Color.white)
                        .font(.system(size: 30))
                        .padding(EdgeInsets(top: 35, leading: 10, bottom: 40, trailing: 10)).frame(width:UIScreen.main.bounds.size.width / 2, height: 50).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    
                    Text(self.PartDescription)
                        .foregroundColor(Color.white)
                        .font(.system(size: 30))
                        .padding(EdgeInsets(top: 35, leading: 10, bottom: 40, trailing: 10)).frame(width:UIScreen.main.bounds.size.width / 2, height: 50).padding(EdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10))
                    
                }.background(Color.gray)
            
            
            StopWatchButton(actions: [self.stopWatch.start, self.stopWatch.pause],
                labels: ["Start", "Pause"],
                color: [Color.orange, Color.gray],bgColor: [".background(Color.orange)", ".backGround(Color.gray"],
                isPaused: self.stopWatch.isPaused()).foregroundColor(Color.white)
                    .padding()
                    .frame(width: 350, height:50)
                
                Text(self.stopWatch.stopWatchTime)
                    .font(.custom("calibri", size: 100))
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.size.width,
                           height: 150,
                           alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            }
            
            VStack{
                Button("Show Popover"){
                    self.showPopover = true
                }.popover(isPresented: self.$showPopover,
                          arrowEdge: .bottom){
                            Text("Waiting for Inspection").padding()
                        HStack{
                            Button("Good"){
                            
                          }.padding()
                           .background(Color.green)
                           .foregroundColor(Color.white)
                           
                            Button("Bad"){
                                
                            } .padding()
                              .background(Color.red)
                              .foregroundColor(Color.white)
                            
                        }
                }.frame(height: 50)
                
            }
            
            Button("Show Modal") {
            
               self.showModal.toggle()
        
            }.foregroundColor(Color.white)
             .sheet(isPresented: $showModal) {
                 ScanningModalView()
             }
        }.navigationBarTitle("Part Number")
            }
    }
    }
}

struct workView_Previews: PreviewProvider {
    static var previews: some View {
        workView()
    }
}
