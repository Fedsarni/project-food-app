//
//  PreferenceView.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 14/11/23.
//

import SwiftUI

struct PreferenceView: View {
    
    
    @State var preference = Preference()
    @ObservedObject var shopModel = sharedShop

    var body: some View {
        
        
            
                /*
                 List(shopModel.preference.favoriteShops) { shop in
                    ShopCardView(shop: shop, toggleFavorite: shopModel.toggleFavorite)
               // }
                .navigationTitle("Preferiti")*/
        
        NavigationView{
            ScrollView{
                ForEach(shopModel.preference.favoriteShops){ shop in
                    ShopCardView(shopPass: shop, toggleFavorite: shopModel.toggleFavorite)
                }
                
            }
            .navigationTitle("Favourites")
        }
                
    }
}
    

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView()
        }
}
