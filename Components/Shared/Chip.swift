//
//  Chip.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct Chip: View {
    var title: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Text(title)
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background(isSelected ? Color("AppBlack") : Color.clear)
                .fontWeight(.semibold)
                .font(.title2)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("AppGray"), lineWidth: 1)
                )
                .foregroundColor(isSelected ? Color("AppGray") : Color("AppBlack"))
        }
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(title: "Beauty", isSelected: false, onTap: {})
    }
}
