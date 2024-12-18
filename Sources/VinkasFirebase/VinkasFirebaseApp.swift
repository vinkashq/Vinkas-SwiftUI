//
//  VinkasFirebase.swift
//  Vinkas
//
//  Created by Vinkas on 14/12/24.
//

import FirebaseAnalytics
import FirebaseCore
import FirebaseAppCheck

open class VinkasFirebaseApp {
    
    open func configureFirebase() {
        #if DEBUG
            AppCheck.setAppCheckProviderFactory(AppCheckDebugProviderFactory())
        #else
            AppCheck.setAppCheckProviderFactory(FirebaseAppCheckProviderFactory())
        #endif

        FirebaseApp.configure()
        self.onFirebaseConfigurationComplete()
        Analytics.logEvent("app_launch", parameters: nil)
    }
    
    open func onFirebaseConfigurationComplete() {}
    
}
