//
//  TooGoodToGoApp.swift
//  TooGoodToGo
//
//  Created by Federica Sarnataro on 14/11/23.
//

import SwiftUI
import CoreData

@main
struct TooGoodToGoApp: App {
    
 //   @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MainScreenView()
                    .tabItem {
                        Image(systemName: "safari")
                        Text("Discover")
                    }
                PreferenceView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourites")
                    }
                MapView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Search")
                    }
            }

        }
    }
}

/* class AppDelegate: NSObject, UIApplicationDelegate {
    lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "ModelManager") // Sostituisci con il nome effettivo del tuo modello
           container.loadPersistentStores(completionHandler: { (storeDescription, error) in
               if let error = error as NSError? {
                   fatalError("Errore nel caricamento del negozio dati: \(error), \(error.userInfo)")
               }
           })
           return container
       }()

       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           // Inizializza Core Data
           _ = persistentContainer

           return true
       }
}*/




