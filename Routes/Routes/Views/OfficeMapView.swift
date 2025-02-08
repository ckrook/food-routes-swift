//
//  OfficeMapView.swift
//  Routes
//
//  Created by Chad Timmerman on 2/7/25.
//

import SwiftUI
import MapKit

struct OfficeMapView: View {
    @State var selectedOffice: Office?
    @State var restaurants = RestaurantModel(restaurants: [])
    @State private var selection: MKMapItem?

    
    @State var selectedRestaurant: Restaurant?
    @State var isPresented: Bool = false

    var body: some View {
        VStack {
            Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: selectedOffice?.lat ?? 0, longitude: (selectedOffice?.long ?? 0)), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), selection: $selection) {

                Annotation(selectedOffice?.name ?? "", coordinate: CLLocationCoordinate2D(latitude: selectedOffice?.lat ?? 0, longitude: selectedOffice?.long ?? 0)) {
                                ZStack {
                                    Image(systemName: "building.2.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }
                }
                
                ForEach(restaurants.restaurants, id: \.name) { restaurant in
                    
                    Annotation(restaurant.name, coordinate: CLLocationCoordinate2D(latitude: restaurant.lat, longitude: restaurant.long)) {
                        
                                    ZStack {
                                        Image(systemName: "fork.knife.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundStyle(Color.red)
                                    }
                                    .onTapGesture {
                                        selectedRestaurant = restaurant
                                    }
                    }
                }
            }
            
            List {
                ForEach(restaurants.restaurants, id: \.name) { restaurant in
                    Text(restaurant.name)
                }
            }
            .frame(maxHeight: UIScreen.main.bounds.height * 0.33)
            .listStyle(.plain)
 
        }
        .navigationTitle(selectedOffice?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: fetchRestaurants)
        .sheet(item: $selectedRestaurant) { restaurant in
            RestaurantDetailsView(restaurant: restaurant)
                    .presentationDetents([.medium, .large])
        }
    }
    
    func fetchRestaurants() {
        Task {
            do {
                restaurants = try await NetworkingService.shared.fetchRestaurants(officeId: self.selectedOffice?.id ?? 0)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    OfficeMapView()
}
