//
//  LoadingView.swift
//  lyric
//
//  Copyright © 2022 Michael Muse. All rights reserved.
//

import SwiftUI

struct LoadingView: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<LoadingView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
