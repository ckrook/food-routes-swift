//
//  RestaurantDetailsView.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import SwiftUI

struct RestaurantDetailsView: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                Text(restaurant.name ?? "")
                    .font(.title).bold()
                
                Spacer()
                
                Button {
                    Task {
                        await NetworkingService.shared.goToRestaurant(restaurant: restaurant)
                    }
                } label: {
                    Text("Go")
                        .frame(width: 60, height: 60)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .font(.title2).bold()
                }
            }
            .padding()
           

            Spacer()
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    RestaurantDetailsView(restaurant: .init(name: "Test", rating: 4.0, totalRatings: 100, lat: 0, long: 0, metadata: nil))
}
