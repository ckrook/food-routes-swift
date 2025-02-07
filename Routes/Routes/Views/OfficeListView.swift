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
            ForEach(offices.offices, id: \.office.id) { office in
                OfficeCard(office: office)
                    .listRowBackground(Color.backgroundDark) // Ensure rows have the same background
            }
        }
        .scrollContentBackground(.hidden) // Hides default list background
        .background(Color.backgroundDark) // Sets background for entire view
        .ignoresSafeArea() // Extends background to edges
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

struct OfficeCard: View {
    let office: Office
    private var randomColor: Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Circle()
                        .fill(randomColor) // Uses the random color
                        .frame(width: 10, height: 10)
                    
                    Text(office.office.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                HStack(spacing: 20) {
                    CardStats(title: "Street", value: office.office.addressline1 ?? "Unknown")
                    CardStats(title: "City", value: office.office.addressline2 ?? "Unknown")
                    CardStats(title: "Zip", value: office.office.name ?? "Unknown")
                }
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.cardBorder, lineWidth: 1)
        )
        .frame(width: 350)
    }
}

struct CardStats: View {
    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .textCase(.uppercase)
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color.fontcolor)
        }
    }
}

#Preview {
    ContentView()
        .padding()
        .background(Color.backgroundDark)
}
