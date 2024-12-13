//
//  Toast.swift
//  Vinkas
//
//  Created by Vinkas on 13/12/24.
//

import SwiftUI

public struct Toast: Equatable {
    var type: ToastType
    var text: String
    var duration: Double = 3.0
}
