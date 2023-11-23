//
//  ShopCardView.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 18/11/23.
//

import SwiftUI



struct ShopCardView: View {
    @State var shopPass: Shop
    
    @ObservedObject var shop = sharedShop
    
    
    func findIndex() -> Int{
        
        for i in 0...shop.shops.count{
            if shop.shops[i].id == shopPass.id{
                return i
            }
        }
        return 0
    }
    
    
    var prefCard: String {
        if shop.shops[findIndex()].isFavorite {
           return "heart.circle.fill"
        } else{
           return "heart.circle"
        }
    }
    
    var toggleFavorite: (Shop) -> Void

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
                Rectangle()
                .frame(height: 174.0)
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 3)
                .accessibilityHidden(true)
  
                    ZStack{
                        
                        
                        Image( shop.shops[findIndex()].image)
                            .resizable()
                            .clipped()
                            .frame(height: 87)
                            .padding(.bottom, 87.0)
                        
                        LinearGradient(
                            gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.3)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 87)
                        .padding(.bottom, 87.0)
                        
                        
                        
                        Text(shop.shops[findIndex()].name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 50.0)
                            
                        
                        Button(action: {
                            toggleFavorite(shop.shops[findIndex()])
                        }) {
                            Image(systemName: prefCard)
                                .foregroundColor(shop.shops[findIndex()].isFavorite ? .white : .white)
                        }
                        .padding([.leading, .bottom], 130.0)
                                .padding(.leading, 150.0)
                                .font(.title)
                                .accessibilityElement(children: .combine)
                                .accessibility(label: Text("Shop: \(shop.shops[findIndex()].name)"))
                                .accessibility(value: Text("\(shop.shops[findIndex()].bagtype), Price: \(String(format: "%.2f", shop.shops[findIndex()].prize)) euros"))
                                
                        
                    }
                    .cornerRadius(20)
                    
                   
                    
                    Text(shop.shops[findIndex()].bagtype)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 50.0)
                        .padding(.leading)
                        .accessibilityHidden(true)
                    
                    
                    Text(String(format: "%.2f", shop.shops[findIndex()].prize) + "€" )
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 11/255, green: 100/255, blue: 97/255))
                        .padding(.leading, 280.0)
                        .accessibilityHidden(true)
                        
                        
                    
                    
            }
            .accessibilityElement(children: .combine)
            .padding()
            
               
      
        
    }
}


/*struct ShopCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleShop = Shop(name: "Sample Shop", bagtype: "Sample Bag", prize: 2.99, image: "sampleImage")
        let toggleFavorite: (Shop) -> Void = { shop in
            // Implementazione della funzione toggleFavorite (potrebbe non essere effettivamente implementata in questa anteprima)
        }

        return ShopCardView(shop: sampleShop, toggleFavorite: toggleFavorite)
            .previewLayout(.sizeThatFits)
    }
}*/
