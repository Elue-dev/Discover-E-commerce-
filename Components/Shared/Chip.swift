//
//  Chip.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct Chip: View {
    @Environment(\.colorScheme) var colorScheme
    var title: String
    let isSelected: Bool
    let onTap: () -> Void
    
    private var theme: ChipTheme {
            ChipTheme(isSelected: isSelected, isDark: colorScheme == .dark)
        }
    
    
    var body: some View {
        let isDarkMode = colorScheme == .dark
        
        Button(action: onTap) {
            Text(title)
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background(theme.backgroundColor)
                .fontWeight(.semibold)
                .font(.title2)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.appGray, lineWidth: 1)
                )
                .foregroundColor(theme.textColor)
        }
    }
}

private struct ChipTheme {
    let isSelected: Bool
    let isDark: Bool
    
    var textColor: Color {
        if isSelected {
            return isDark ? .appBlack : .appGray
        } else {
            return isDark ? .appGray : .appBlack
        }
    }
    
    var backgroundColor: Color {
        guard isSelected else { return .clear }
        return isDark ? .appGray : .appBlack
    }
}
struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(title: "Beauty", isSelected: false, onTap: {})
    }
}
