//
//  AlertItem.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissbutton: Alert.Button
}

struct AlertContext {
    
    static let unableToGetData = AlertItem(title: Text("Data Error"),
                                            message: Text("Make a new search."),
                                                dismissbutton: .default(Text("OK")))
    
    static let unableToGetSearch = AlertItem(title: Text("Search error"),
                                            message: Text("Make a new search."),
                                                dismissbutton: .default(Text("OK")))
        
}
