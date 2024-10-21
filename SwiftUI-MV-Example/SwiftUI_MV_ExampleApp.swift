//
//  SwiftUI_MV_ExampleApp.swift
//  SwiftUI-MV-Example
//
//  Created by Donghan Kim on 10/21/24.
//

import SwiftUI

@main
struct SwiftUI_MV_ExampleApp: App {
    @StateObject private var storeModel = StoreModel(webservice: WebService())
    var body: some Scene {
        WindowGroup {
            // DI for StoreModel
            ContentView().environmentObject(storeModel)
        }
    }
}
