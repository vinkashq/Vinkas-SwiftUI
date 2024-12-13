//
//  ToastView.swift
//  Vinkas
//
//  Created by Vinkas on 13/12/24.
//

import SwiftUI

struct ToastView: View {
  
  var toast: Toast

  var body: some View {
      GeometryReader { geometry in
          HStack(spacing: 8) {
              Image(systemName: self.toast.type.icon)
                  .foregroundColor(self.toast.type.color)
              Text(self.toast.text)
                  .font(Font.caption)
          }
          .background(Color(UIColor.systemBackground))
          .padding(8)
          .frame(minWidth: 0, maxWidth: CGFloat.infinity)
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
    ToastView(toast: .init(type: .success, text: "Your request was successful"))
    ToastView(toast: .init(type: .error, text: "There was an error processing your request"))
}
