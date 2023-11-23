//
//  MapView.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 14/11/23.
//

import MapKit
import SwiftUI


struct MapView: View {
   
    @State private var position : MapCameraPosition = .userLocation(fallback: .automatic)
   
   
    
    var body: some View {
 
        NavigationStack {
                    Map(position: $position) {
                        
                    }
                    .mapControls {
                        MapUserLocationButton()
                    }
                    .onAppear {
                        CLLocationManager().requestWhenInUseAuthorization()
                    }
                    .navigationTitle("Search")
                }
               
        
    }
}


        
 /*struct CustomMarker: View {
        var name: String
        var coordinate: CLLocationCoordinate2D
        var tint: Color

        var body: some View {
            ZStack {
                Circle()
                    .fill(tint)
                    .frame(width: 20, height: 20)

                Text(name)
                    .foregroundColor(.white)
                    .font(.footnote)
            }
            .offset(x: 0, y: -10)
            .onTapGesture {
                // Azione quando il marker viene toccato
            }
        }
    }*/



#Preview {
        MapView()
        }


