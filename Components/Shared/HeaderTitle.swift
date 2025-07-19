//
//  HeaderTitle.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct HeaderTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2).bold()
    }
}

struct HeaderTitle_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTitle(title: "My Screen")
    }
}
