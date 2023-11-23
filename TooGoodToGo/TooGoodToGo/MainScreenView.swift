//
//  MainScreenView.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 14/11/23.
//

import SwiftUI

struct MainScreenView: View {
    
    @ObservedObject var shopModelLocal = sharedShop
    //@ObservedObject var prefernceLocal = Preference()
    
    @State private var searchText = ""
    
    var searchResults: [Shop] {
        if searchText.isEmpty {
            return sharedShop.shops
        } else {
            return sharedShop.shops.filter { $0.name.contains(searchText)}
        }
    }
    
    
    var body: some View {
        NavigationView {            
            ScrollView {
                VStack{
                    
                    ForEach(searchResults){ shop in
                        ShopCardView(shopPass: shop, toggleFavorite: sharedShop.toggleFavorite)
   
                    }//end scroll
                    .navigationTitle("Recommended for you")
                    
                }
                
            }
            .searchable(text: $searchText)
            
            
        }
        
        // Function to save data to your Core Data model
        /*  func saveData(shop: Shop) {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
         
         let newObject = EntityName(context: context)
         newObject.attribute = "Value"
         
         do {
         try context.save()
         print("Data saved successfully!")
         } catch {
         print("Error during save: \(error)")
         }
         }
         */
    }
}

    struct MainScreenView_Previews: PreviewProvider {
        static var previews: some View {
            MainScreenView()
            }
    }
