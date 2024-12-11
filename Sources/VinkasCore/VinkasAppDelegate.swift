//
//  AppDelegate.swift
//  Vinkas
//
//  Created by Vinkas on 11/12/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck

#if os(iOS)
class VinkasAppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    let providerFactory = VinkasAppCheckProviderFactory()
    AppCheck.setAppCheckProviderFactory(providerFactory)

    FirebaseApp.configure()

    return true
  }
}
#endif
