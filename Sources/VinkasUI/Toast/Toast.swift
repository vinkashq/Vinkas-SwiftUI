//
//  Toast.swift
//  Vinkas
//
//  Created by Vinkas on 13/12/24.
//

import SwiftUI

public struct Toast: Equatable {
    public init(type: ToastType, text: String, duration: Double = 3.0) {
        self.type = type
        self.text = text
        self.duration = duration
    }

    public var type: ToastType
    public var text: String
    public var duration: Double
}
