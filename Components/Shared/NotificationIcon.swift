//
//  NotificationIcon.swift
//  Discover
//
//  Created by Wisdom on 7/19/25.
//

import SwiftUI

struct NotificationIcon: View {
    var body: some View {
        Image(systemName: "bell")
            .fontWeight(.semibold)
        .font(.title)
    }
}

struct NotificationIcon_Previews: PreviewProvider {
    static var previews: some View {
        NotificationIcon()
    }
}
