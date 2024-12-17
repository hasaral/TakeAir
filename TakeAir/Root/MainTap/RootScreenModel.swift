//
//  RootScreenModel.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import Foundation
import Combine
import ServiceManager

final class RootScreenModel: ObservableObject {
    
    @Published private(set) var setState = SerState.pending
    private var cancelable: AnyCancellable?
    
    init() {
        cancelable = NetworkManager.shared.serState.receive(on: DispatchQueue.main)
            .sink { [weak self] latestAuthState in
                self?.setState = latestAuthState
            }
    }
}