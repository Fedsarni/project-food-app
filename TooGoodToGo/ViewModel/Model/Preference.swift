//
//  Preference.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 19/11/23.
//

import Foundation

class Preference: ObservableObject {
    
    @Published var favoriteShops: [Shop] = []

    func addToFavorites(shop: Shop) {
            if !favoriteShops.contains(where: { $0.id == shop.id }) {
                favoriteShops.append(shop)
            }
        }

    func removeFromFavorites(shop: Shop) {
            favoriteShops.removeAll { $0.id == shop.id }
    }
    
    func isFavorite(shop: Shop) -> Bool {
        return favoriteShops.contains(where: { $0.id == shop.id })
    }
}


