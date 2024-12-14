//
//  SingFactAppCheckProviderFactory.swift
//  Vinkas
//
//  Created by Vinkas on 11/12/24.
//

import FirebaseCore
import FirebaseAppCheck

class FirebaseAppCheckProviderFactory: NSObject, AppCheckProviderFactory {
    func createProvider(with app: FirebaseApp) -> AppCheckProvider? {
        if #available(iOS 14.0, macOS 11.3, *) {
            return AppAttestProvider(app: app)
        } else if #available(iOS 1.0, macOS 10.15, *) {
            return DeviceCheckProvider(app: app)
        }
    }
}
