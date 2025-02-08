//
//  ContentView.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationStack {
            OfficeListView()
                .navigationTitle("Offices")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
