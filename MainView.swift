//
//  ContentView.swift
//  Discover
//
//  Created by Wisdom on 7/18/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Discover")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "bell")
                        .fontWeight(.semibold)
                        .font(.title2)
                }
                
                VStack {
                    CategoriesSection(viewModel: viewModel)
                    ProductsGrid(viewModel: viewModel)
                }
                .padding(.top, 20)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
