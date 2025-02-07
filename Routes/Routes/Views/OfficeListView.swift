//
//  OfficeListView.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import SwiftUI

struct OfficeListView: View {
    @State var offices = Offices(offices: [])
    
    var body: some View {
        List {
            ForEach(offices.offices, id: \.self.office.id) { office in
                Text(office.office.name)
            }
        }
        .onAppear(perform: fetchOffices)
        .refreshable {
            fetchOffices()
        }
    }
    
    func fetchOffices() {
        Task {
            do {
                offices = try await NetworkingService.shared.fetchOffices()
            } catch {
               print(error.localizedDescription)
            }
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
