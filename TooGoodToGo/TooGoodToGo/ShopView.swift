//
//  ShopView.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 16/11/23.
//

import SwiftUI

struct ShopView: View {
    @ObservedObject var shopModel = ShopModel()
    
    var body: some View {
                
                VStack {
 
                        ForEach(shopModel.shops) { shop in
                            ZStack(alignment: .bottomLeading) {
                                Rectangle()
                                    .frame(width: 351.0, height: 174.0)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                
                                
                                ZStack{
                                    Image(shop.image)
                                        .resizable()
                                        .clipped()
                                        .frame(width: 351.0, height: 87)
                                        .padding(.bottom, 87.0)
                                    
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.3)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .frame(width: 351.0, height: 87)
                                    .padding(.bottom, 87.0)
                                    
                                    
                                    
                                    Text(shop.name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.bottom, 50.0)
                                    ZStack{
                                        Button("Preference", systemImage: "heart.circle", action: {})
                                            .labelStyle(.iconOnly)
                                            .foregroundColor(.white)
                                            .padding([.leading, .bottom], 140.0)
                                            .padding(.leading, 150.0)
                                            .font(.title2)
                                    }
                                    
                                }
                                .cornerRadius(20)
            
                                Text(shop.bagtype)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 50.0)
                                    .padding(.leading)
                                
                                
                                Text(String(format: "%.2f", shop.prize) + "€" )
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 11/255, green: 100/255, blue: 97/255))
                                    .padding(.leading,280.0)
                                
                                
                            }//end zstack rectangle
                            
                            
                        }//end for each
                }//end vstack
           
            //Text("hello")
        
    }
}

#Preview {
    ShopView()
}
