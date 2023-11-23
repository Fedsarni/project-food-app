//
//  Shop.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 15/11/23.
//

import Foundation

class Shop: Identifiable
{
    var id: UUID = UUID()
    var name: String = ""
    var bagtype: String = ""
    var prize: Float
    var image: String = ""
    var isFavorite: Bool = false
    
    init(name: String, bagtype: String, prize: Float, image: String) {
        self.name = name
        self.bagtype = bagtype
        self.prize = prize
        self.image = image
    }
}
