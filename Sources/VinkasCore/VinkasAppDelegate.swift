//
//  AppDelegate.swift
//  Vinkas
//
//  Created by Vinkas on 11/12/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck
import FirebaseAnalytics

#if os(iOS)
open class VinkasAppDelegate: NSObject, UIApplicationDelegate {
    public func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let providerFactory = VinkasAppCheckProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)

        FirebaseApp.configure()
        self.onFirebaseAppConfigurationComplete()
        Analytics.logEvent("app_launch", parameters: nil)

        return true
    }

    public func onFirebaseAppConfigurationComplete() {}
}
#endif
