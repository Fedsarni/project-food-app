//
//  ShopModel.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 15/11/23.
//

import Foundation
import CoreData


class ShopModel: ObservableObject {
    
   
    @Published var preference = Preference()
    

    @Published var shops: [Shop] = [
        Shop(name: "Sole 365", bagtype : "Surprise bag", prize: 4.99 ,image: "Sole 365"),
        Shop(name: "Pasticceria Del Corso", bagtype : "Surprise bag sweet", prize: 4.99 ,image:"Pasticceria Del Corso"),
        Shop(name: "Barlume Coffee", bagtype : "Surprise bag medium ", prize: 2.99 ,image:"Barlume Coffee"),
        Shop(name: "Juntos Cafè", bagtype : "Surprise bag mini", prize: 1.99 ,image:"Juntos Cafè" ),
        Shop(name: "Planet pizza", bagtype : "Surprise bag", prize: 4.99,image: "Planet pizza" )
        ]
    
    /* var favoriteShops: [Shop] {
           return shops.filter { $0.isFavorite }
       }*/

    func toggleFavorite(shop: Shop) {
            if let index = shops.firstIndex(where: { $0.id == shop.id }) {
                shops[index].isFavorite.toggle()

                if shops[index].isFavorite {
                    preference.addToFavorites(shop: shops[index])
                } else {
                    preference.removeFromFavorites(shop: shops[index])
                }

                objectWillChange.send()
            }
        }
    
    
}

var sharedShop = ShopModel() //per osservare lo stesso oggetto

