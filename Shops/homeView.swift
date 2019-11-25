//
//  ContentView.swift
//  Shops
//
//  Created by Matthew  Martin on 11/8/19.
//  Copyright © 2019 AerospaceCoatings. All rights reserved.
//

import SwiftUI

struct homeView: View {
    
    @State private var newTitle:String = ""
    
    var body: some View {
        NavigationView{
            listView()
        }
    }
}

struct listView:  View{
    var body: some View {
        List(0..<5){item in
            Text("Tap to see more!")
        }.navigationBarTitle("Hello, List!")
        
    }
}
/*
struct DetailView: View{
    var body: some View{
        Text("Hello!")
    }
}*/

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
      homeView()
    }
}

