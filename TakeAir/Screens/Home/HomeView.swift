//
//  HomeView.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            switch viewModel.setState {
            case .pending:
                LoadingView()
            case .search:
                let viewModel = SearchViewModel()
                SearchView(viewModel: viewModel)
            }
        }
        .padding()
        .onAppear {
            Task {
                await viewModel.onAppear()
            }
        }
    }
}
