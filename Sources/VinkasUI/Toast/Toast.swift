//
//  Toast.swift
//  Vinkas
//
//  Created by Vinkas on 13/12/24.
//

import SwiftUI

public struct Toast: Equatable {
    public var type: ToastType
    public var text: String
    public var duration: Double = 3.0
}
