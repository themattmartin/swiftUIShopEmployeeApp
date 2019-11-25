//
//  ContentView.swift
//  Shops
//
//  Created by Matthew  Martin on 11/8/19.
//  Copyright © 2019 AerospaceCoatings. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive:Bool = false
    
    @State private var password:String = "1"
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed:Bool = false
    

    
    
    var body: some View {
     ZStack{
        Color( red: 67/255, green: 133/255, blue: 176/255)
            VStack{
                Group{
                Image("logo2")
                    .resizable()
                    .frame(width: 350, height:50)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                
                Divider()
                    
                TextField("ScanSystem Password", text: $password)
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 8)
                
                Divider()
                }
                Button(action:{
                    if self.password  == "1" {self.authenticationDidSucceed = true
                        print("login suuceeded")
                    }else{self.authenticationDidFail = true
                    print("login failed")
                    } }){
                    Text("Login")
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: Alignment.top)
                .foregroundColor(Color.white)
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                .background(Color.init(red: 242/255, green:163/255, blue:64/255))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)
            
                if authenticationDidFail{
                    Text("Login Failed")
                        .foregroundColor(Color.red)
                    .padding()
                }
                
            }
            
            .edgesIgnoringSafeArea(.vertical)
            .frame(width: 350, height: 500, alignment: .center)
       
        }
        
    }

}


struct loginButton: PrimitiveButtonStyle {
    var color: Color

        func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
            MyButton(configuration: configuration, color: color)
        }
        
        struct MyButton: View {
            @GestureState private var pressed = false

            let configuration: PrimitiveButtonStyle.Configuration
            let color: Color

            var body: some View {
                let longPress = LongPressGesture(minimumDuration: 1.0, maximumDistance: 0.0)
                    .updating($pressed) { value, state, _ in state = value }
                    .onEnded { _ in
                       self.configuration.trigger()
                     }

                return configuration.label
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 5).fill(color))
                    .compositingGroup()
                    //.shadow(color: .black, radius: 3)
                    .opacity(pressed ? 0.5 : 1.0)
                    .scaleEffect(pressed ? 0.8 : 1.0)
                    .gesture(longPress)
                    

            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
