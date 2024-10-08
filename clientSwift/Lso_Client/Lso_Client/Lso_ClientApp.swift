//
//  RegisterView.swift
//  Lso_Client
//
//  Created on 11/08/24.
//

import SwiftUI

@main
struct Lso_ClientApp: App {
    @StateObject private var networkManager = NetworkManager.shared
    @StateObject private var cartManager = CartManager()


    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(networkManager)
                .environmentObject(cartManager)
        }
    }
}
