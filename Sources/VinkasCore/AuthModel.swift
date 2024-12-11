//
//  AuthModel.swift
//  Vinkas
//
//  Created by Vinkas on 11/12/24.
//

import SwiftUI
import FirebaseAuth

class AuthModel: ObservableObject {
    @Published var isAuthenticated = false
    var service: Auth
    var handle: NSObjectProtocol?

    init() {
        service = Auth.auth()
    }

    func onAppear() {
        handle = service.addStateDidChangeListener { [weak self] (auth, user) in
            self?.isAuthenticated = user != nil
        }
    }

    func onDisappear() {
        service.removeStateDidChangeListener(handle!)
    }
}
