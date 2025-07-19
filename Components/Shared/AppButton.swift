//
//  AppButton.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct AppButton: View {
    @Environment(\.colorScheme) var colorScheme
    var buttonLabel: String
    var hasIcon: Bool?
    var iconName: String?
    var disabled: Bool?
    var onTap: () -> Void
    
    var isDisabled: Bool {
        disabled ?? false
    }
    
    var body: some View {
        let isDarkMode = colorScheme == .dark
        
        Button {
            onTap()
        } label: {
            HStack(spacing: 15) {
                Text(buttonLabel)
                    .font(.title2)
                    .fontWeight(.semibold)
                if hasIcon ?? false {
                    Image(systemName: iconName ?? "arrow.right")
                        .fontWeight(.semibold)
                }
            }
            .foregroundColor(
                isDisabled && isDarkMode ?
                Color.white
                : isDisabled && !isDarkMode ?
                Color.gray
                : Color.buttonText)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .frame(height: 60)
            .background(
                isDisabled && isDarkMode
                ? Color.gray :
                    isDisabled && !isDarkMode
                ? Color.appGray
                : Color.button
            )
            .cornerRadius(10)
            .padding()
        }
        .disabled(isDisabled)
        .buttonStyle(.plain)

    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(
            buttonLabel: "Proceed", hasIcon: true, iconName: "arrow.right", disabled: false) {
                
            }
    }
}
