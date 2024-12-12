//
//  LoadingAnimation.swift
//  Vinkas
//
//  Created by Vinkas on 12/12/24.
//

import SwiftUI

public struct LoadingAnimation: View {
    @State var isAnimating: Bool = false

    public init() {}

    public var body: some View {
        Circle()
            .trim(from: 0.6, to: 1.0)
            .stroke(style: StrokeStyle(lineWidth: 2))
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
                }
            }
            .overlay(
                Circle()
                    .trim(from: 0, to: 0.4)
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(isAnimating ? -360 : 0))
            )
    }
}

#Preview {
    LoadingAnimation()
}
