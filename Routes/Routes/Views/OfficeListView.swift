//
//  OfficeListView.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import SwiftUI

struct OfficeListView: View {
    @State var offices: [Office] = []
    
    var body: some View {
        List {
        }
    }
}

#Preview {
    OfficeListView()
}

struct OfficeView: View {
    @State var office: Office?
    
    var body: some View {
        Text("Hello, World!")
    }
}
