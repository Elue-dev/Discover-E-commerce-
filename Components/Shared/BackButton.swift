//
//  BackButton.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let isDarkMode = colorScheme == .dark
        
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .accentColor(isDarkMode ? .white : .black)
                .font(.title)
                .fontWeight(.semibold)
        }

    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
