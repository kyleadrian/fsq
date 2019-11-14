//
//  AppDelegate.swift
//  FSQ-iOS
//
//  Created by Kyle Wiltshire on 11/14/19.
//  Copyright © 2019 Kyle Wiltshire. All rights reserved.
//

import UIKit
import Pilgrim

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        PilgrimManager.shared().configure(withConsumerKey: K.fsqKey, secret: K.fsqSecret, delegate: self as? PilgrimManagerDelegate, completion: nil)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate : PilgrimManagerDelegate {
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handle visit: Visit) {
        print("\(visit.hasDeparted ? "Departure from:" : "Arrival at:")\(visit.venue?.name ?? "Unknown venue") Added a pilgrim visit at \(visit.displayName)")
    }
    
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handleBackfill visit: Visit) {
        print("Backfill \(visit.hasDeparted ? "Departure from:" : "Arrival at:")\(visit.venue?.name ?? "Unknown venue") Added a pilgrim backfill visit at \(visit.displayName)")
    }
    
    func pilgrimManager(_ pilgrimManager: PilgrimManager, handle geofenceEvents: [GeofenceEvent]) {
        geofenceEvents.forEach { geofenceEvent in
          print(geofenceEvent)
        }
    }
}

