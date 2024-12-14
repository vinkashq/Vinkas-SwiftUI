//
//  VinkasFirebase.swift
//  Vinkas
//
//  Created by Vinkas on 14/12/24.
//

import FirebaseCore
import FirebaseAppCheck

public class VinkasFirebase {
    
    public static func configure() {
        #if DEBUG
            AppCheck.setAppCheckProviderFactory(AppCheckDebugProviderFactory())
        #else
            AppCheck.setAppCheckProviderFactory(FirebaseAppCheckProviderFactory())
        #endif

        FirebaseApp.configure()
    }
    
}
