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
        NavigationStack {
            OfficeListView()
                .navigationTitle(Text("Offices"))
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
