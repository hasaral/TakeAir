//
//  RootView.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import SwiftUI
import CommonModel

struct RootView: View {
    @StateObject private var viewModel = RootScreenModel()
    @AppStorage("searchKey") var searchKey: String?
    
    init() {
        let thumbImage = UIImage(systemName: "circle.fill")
        UISlider.appearance()
            .setThumbImage(thumbImage, for: .normal)
        //searchKey = ""
    }
    
    @State var selectedTab = Tab.one
    
    var body: some View {
        let viewModel = HomeViewModel()
        
        TabView(selection: $selectedTab) {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Label("", systemImage: "globe.europe.africa")
                }
                .tag(Tab.one)
            
            OtherView()
                .tabItem {
                    Label("", systemImage: "mappin.circle.fill")
                }
                .tag(Tab.two)
            
        } // TabView
        .accentColor(.red)
        .background(Color.white)
    }
}


public enum Tab: Hashable {
    case one
    case two
}
