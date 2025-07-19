//
//  BackgroundWraper.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct BackgroundWrapper<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            content
        }
    }
}

struct BackgroundWrapper_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundWrapper {
            Text("Hello, World!")
        }
    }
}
