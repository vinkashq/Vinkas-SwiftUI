//
//  LoadingAnimation.swift
//  Vinkas
//
//  Created by Vinkas on 12/12/24.
//

import SwiftUI

public struct LoadingAnimation: View {
    public var body: some View {
        Circle()
            .trim(from: 0.5, to: 1.0)
            .stroke(style: StrokeStyle(lineWidth: 2))
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(360))
            .animation(Animation.linear(duration: 1).repeatForever())
            .overlay(
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(-360))
                    .animation(Animation.linear(duration: 1).repeatForever())
            )
    }
}

#Preview {
    LoadingAnimation()
}
