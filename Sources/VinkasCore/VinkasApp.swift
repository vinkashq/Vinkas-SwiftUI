//
//  VinkasApp.swift
//  Vinkas
//
//  Created by Vinkas on 18/12/24.
//

import SwiftUI
import VinkasFirebase
import Sentry

open class VinkasApp: VinkasFirebaseApp {
    public override init() {
        super.init()
    }

    open func configure() {
        self.configureSentry()
        self.configureFirebase()
    }

    open func configureSentry() {
        let dsn = Bundle.main.object(forInfoDictionaryKey: "SENTRY_DSN") as? String

        SentrySDK.start { options in
            options.dsn = dsn
            options.debug = true // Enabling debug when first installing is always helpful

            // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
            // We recommend adjusting this value in production.
            options.tracesSampleRate = 1.0
        }

        // Manually call startProfiler and stopProfiler
        // to profile the code in between
        SentrySDK.startProfiler()
        // this code will be profiled
    }
}
