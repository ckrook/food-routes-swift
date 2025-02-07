//
//  ContentView.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "Test"
    
    var body: some View {
        NavigationView {
            
            List {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            
            
            
            
            VStack {
                HeaderView()
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(name)
            }
            .padding()
    //        .onAppear(perform: fetchData)
//            .refreshable {
//                fetchData()
//            }
        }
        .refreshable {
            fetchData()
        }
        .navigationTitle(Text("Title"))
        
    }
    
    func fetchData() {
        name = "Restuarant "
    }
}

#Preview {
    ContentView()
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.up.circle")
            Image(systemName: "arrow.up.circle")
            Image(systemName: "arrow.up.circle")
            Image(systemName: "arrow.up.circle")
            Image(systemName: "arrow.up.circle")
            Image(systemName: "arrow.up.circle")
            Image(systemName: "arrow.up.circle")
            
            
        }
        .padding()
    }
}
