//
//  HomeViewModel.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import SwiftUI
import CommonModel
import ServiceManager
import Combine

final class HomeViewModel: ObservableObject {
    @Published private(set) var setState = SerState.pending
    private var cancelable: AnyCancellable?
    @State var searchText = ""
    init() {
        
        cancelable = NetworkManager.shared.serState.receive(on: DispatchQueue.main)
            .sink { [weak self] latestAuthState in
                self?.setState = latestAuthState
            }
    }

    func onAppear() async {
        await NetworkManager.shared.statusCheck()
    }

    private func fetchData() {
        Task { @MainActor in
            do {
                try await NetworkManager.shared.baseCall()
            }
            catch {
                print("Data error home")
            }
        }
    }
}