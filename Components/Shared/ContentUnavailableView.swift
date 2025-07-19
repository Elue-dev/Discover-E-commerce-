//
//  ContentUnavailableView.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct ContentUnavailableView: View {
    var title: String
    var description: String
    var iconName: String?
    
    var body: some View {
        VStack {
            Image(systemName: iconName ?? "questionmark.text.page.fill")
                .font(.largeTitle)
                .padding(.bottom, 1)
            
            Text(title)
                .bold()
                .font(.title2)
            
            Text(description)
                .frame(maxWidth: 300)
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
    }
}

struct ContentUnavailableView_Previews: PreviewProvider {
    static var previews: some View {
        ContentUnavailableView(title: "Content Unavailable", description: "The requested resource is unavailable at the moment", iconName: "questionmark.square.dashed")
    }
}
