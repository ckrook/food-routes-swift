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
    @State var restaurants = [Restaurant]()
    
    var body: some View {
        VStack {
            Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: selectedOffice?.lat ?? 0, longitude: (selectedOffice?.long ?? 0)), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))) {
                
                Annotation(selectedOffice?.name ?? "", coordinate: CLLocationCoordinate2D(latitude: selectedOffice?.lat ?? 0, longitude: selectedOffice?.long ?? 0)) {
                                ZStack {
                                    Image(systemName: "building.2.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }
                            }
            }

        }
        .navigationTitle(selectedOffice?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            
        }
    }
    
    func fetchRestaurants() {
        Task {
            
        }
    }
}

#Preview {
    OfficeMapView()
}
