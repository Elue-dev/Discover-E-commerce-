//
//  ContentView.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        let isDarkMode = colorScheme == .dark
        
        TabView {
            HomeView()
                .environmentObject(cartManager)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            SavedView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Saved")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Account")
                }
        }
        .accentColor(isDarkMode ? Color.appGray : Color.appBlack)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = UIColor.clear
            appearance.shadowColor = UIColor(Color.primary.opacity(0.3))
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .font: UIFont.systemFont(ofSize: 12, weight: .medium)
            ]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                .font: UIFont.systemFont(ofSize: 12, weight: .semibold)
            ]
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
