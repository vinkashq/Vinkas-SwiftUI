//
//  AuthModel.swift
//  Vinkas
//
//  Created by Vinkas on 11/12/24.
//

import SwiftUI
import FirebaseAuth

public class VinkasAuthModel: ObservableObject {
    @Published public var isAuthenticated = false
    public var service: Auth
    var handle: NSObjectProtocol?

    public init() {
        service = Auth.auth()
    }

    public func onAppear() {
        handle = service.addStateDidChangeListener { [weak self] (auth, user) in
            self?.isAuthenticated = user != nil
        }
    }

    public func onDisappear() {
        service.removeStateDidChangeListener(handle!)
    }
}
