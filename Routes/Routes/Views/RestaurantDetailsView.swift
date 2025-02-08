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
            
            // Top row: restaurant name + "Go" button
            HStack {
                Text(restaurant.name)
                    .font(.title).bold()
                
                Spacer()
                
                Button {
                    Task {
                        await NetworkingService.shared.goToRestaurant(restaurant: restaurant)
                    }
                } label: {
                    Text("Go")
                        .frame(width: 60, height: 60)
                        .background(.green)
                        .cornerRadius(50)
                        .foregroundColor(.white)
                        .font(.title2).bold()
                }
            }
            
            // Numeric rating + total ratings
            Text("Rating: \(restaurant.rating ?? 0.0, specifier: "%.1f")")
                .padding(.top, 8)
            
            // Star rating (assuming you've created a StarRatingView from previous example)
            StarRatingView(rating: restaurant.rating ?? 0.0)
                .padding(.top, 4)
            
            // MARK: Display metadata, e.g., serves lunch / vegetarian
            if let metadata = restaurant.metadata {
                VStack(alignment: .leading, spacing: 6) {
                    if metadata.servesLunch == true {
                        Label("Serves Lunch", systemImage: "fork.knife")
                    }
                    if metadata.servesVegetarian == true {
                        Label("Serves Vegetarian", systemImage: "leaf")
                    }
                }
                .padding(.top, 12)
            }
            
            Text("People that are going here: \(restaurant.numberPplCommitted ?? 0)")
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    RestaurantDetailsView(
        restaurant: Restaurant(
            name: "Test Restaurant",
            rating: 4.5,
            totalRatings: 100,
            lat: 0,
            long: 0,
            metadata: Metadata(
                servesLunch: true,
                curbsidePickup: nil,
                servesVegetarian: false,
                placeID: "12345",
                website: "https://myrestaurant.com"
            ),
            numberPplCommitted: 10
        )
    )
}


/// A simple star-based rating view that supports half stars.
struct StarRatingView: View {
    var rating: Double        // e.g., 3.7
    var maximumStars: Int = 5 // Default to 5 stars
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...maximumStars, id: \.self) { index in
                star(for: index)
                    .foregroundColor(.yellow)
            }
        }
    }
    
    /// Determines which SF Symbol to display (full star, half star, or empty star)
    func star(for index: Int) -> Image {
        // Calculate how much of this star should be filled
        let starFillLevel = rating - Double(index - 1)
        
        switch starFillLevel {
        case 1.0...:
            // 1 or more means the star is fully filled
            return Image(systemName: "star.fill")
        case 0.5..<1.0:
            // Between 0.5 and 1.0 means a half-filled star
            return Image(systemName: "star.lefthalf.fill")
        default:
            // Less than 0.5 means empty star
            return Image(systemName: "star")
        }
    }
}


#Preview {
    RestaurantDetailsView(restaurant: .init(
        name: "Test Restaurant",
        rating: 3.5,
        totalRatings: 100,
        lat: 0,
        long: 0,
        metadata: nil,
        numberPplCommitted: 10
    ))
}
