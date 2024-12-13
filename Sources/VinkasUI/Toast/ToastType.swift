//
//  ToastStyle.swift
//  Vinkas
//
//  Created by Vinkas on 13/12/24.
//

import SwiftUI

public enum ToastType {
    case info
    case success
    case warning
    case error
}

extension ToastType {
    var icon: String {
        switch self {
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }

    var color: Color {
        switch self {
        case .info: return Color.blue
        case .success: return Color.green
        case .warning: return Color.orange
        case .error: return Color.red
        }
    }
}
