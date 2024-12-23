//
//  ToastView.swift
//  Vinkas
//
//  Created by Vinkas on 13/12/24.
//

import SwiftUI
#if os(iOS)
import UIKit
#endif

public struct ToastView: View {
  var toast: Toast
    
  public init(toast: Toast) {
      self.toast = toast
  }

  public var body: some View {
      GeometryReader { geometry in
          HStack(spacing: 8) {
              Image(systemName: self.toast.type.icon)
                  .foregroundColor(self.toast.type.color)
              Text(self.toast.text)
                  .font(Font.callout)
          }
          .frame(minWidth: 0, maxWidth: CGFloat.infinity)
          .padding(8)
#if os(iOS)
          .background(Color(UIColor.systemBackground))
#endif
          .cornerRadius(8)
          .overlay(
              RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 0.5)
          )
          .padding(.horizontal, geometry.size.width / 6)
      }
  }
}

#Preview {
    VStack {
        ToastView(toast: .init(type: .success, text: "Your request was successful"))
        ToastView(toast: .init(type: .error, text: "There was an error processing your request"))
    }
    .background(Color.accentColor)
}
