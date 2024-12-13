//
//  View.swift
//  Vinkas
//
//  Created by Vinkas on 13/12/24.
//

import SwiftUI

extension View {

  public func toaster(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastViewModifier(toast: toast))
  }
}
