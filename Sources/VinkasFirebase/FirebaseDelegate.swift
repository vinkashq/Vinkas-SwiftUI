//
//  AppDelegate.swift
//  Vinkas
//
//  Created by Vinkas on 11/12/24.
//

import FirebaseAnalytics

#if os(iOS)
open class FirebaseDelegate: NSObject, UIApplicationDelegate {
    public func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        VinkasFirebase.configure()
        self.onFirebaseConfigurationComplete()
        Analytics.logEvent("app_launch", parameters: nil)

        return true
    }

    open func onFirebaseConfigurationComplete() {}
}
#endif
