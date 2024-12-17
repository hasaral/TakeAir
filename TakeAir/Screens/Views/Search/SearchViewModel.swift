//
//  SearchViewModel.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import SwiftUI
import CommonModel
import ServiceManager
import Combine

final class SearchViewModel: ObservableObject {
    @Published private(set) var setState = SearchState.pending
    private var cancelable: AnyCancellable?
    @Published var weatherElement: [WeatherElement] = []
    @State var searchText = ""
    @Published var alertItem : AlertItem?

    init() {
        cancelable = NetworkManager.shared.searchState.receive(on: DispatchQueue.main)
            .sink { [weak self] latestAuthState in
                self?.setState = latestAuthState
            }
    }
    
    func fetchData(searchText: String) {
        Task { @MainActor in
            weatherElement = try! await NetworkManager.shared.search(with: searchText)
        }
    }
    
    func fetchDetail() {
        Task { @MainActor in
            do {
                try await NetworkManager.shared.baseCall()
            }
            catch {

                print("Data error search")
            }
        }
    }
}
