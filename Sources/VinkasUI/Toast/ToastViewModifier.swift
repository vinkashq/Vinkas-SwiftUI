//
//  ToastModifier.swift
//  Vinkas
//
//  Created by Vinkas on 13/12/24.
//

import SwiftUI

struct ToastViewModifier: ViewModifier {

    @State var dispatchWorkItem: DispatchWorkItem?
    @Binding var toast: Toast?
  
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                view()
                    .offset(y: 64)
                    .animation(.easeIn, value: toast)
            )
            .onChange(of: toast) { value in
                show()
            }
    }
  
    @ViewBuilder func view() -> some View {
        if let toast = toast {
            ToastView(toast: toast)
        }
    }
  
    func show() {
        guard let toast = toast else { return }

        if toast.duration > 0 {
            dispatchWorkItem?.cancel()
          
            let task = DispatchWorkItem {
                dismiss()
            }

            dispatchWorkItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
  
    func dismiss() {
        withAnimation {
          toast = nil
        }
    
        dispatchWorkItem?.cancel()
        dispatchWorkItem = nil
    }
}
