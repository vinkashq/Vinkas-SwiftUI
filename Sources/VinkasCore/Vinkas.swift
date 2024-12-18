//
//  Vinkas.swift
//  Vinkas
//
//  Created by Vinkas on 18/12/24.
//

import SwiftUI
import VinkasFirebase
import Sentry

open class Vinkas: VinkasFirebase, @unchecked Sendable {
    public override init() {
        super.init()
    }

    open func configure() {
        self.configureSentry()
        self.configureFirebase()
        SentrySDK.startProfiler()
    }

    open func configureSentry() {
        let dsn = Bundle.main.object(forInfoDictionaryKey: "SENTRY_DSN") as? String

        SentrySDK.start { options in
            options.dsn = dsn

            // TODO: check whether we can disable this in production
            options.debug = true

            // TODO: adjust this value in production.
            options.tracesSampleRate = 1.0
        }
    }
}
