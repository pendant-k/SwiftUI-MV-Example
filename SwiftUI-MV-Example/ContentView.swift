//
//  ContentView.swift
//  SwiftUI-MV-Example
//
//  Created by Donghan Kim on 10/21/24.
//

import SwiftUI

// MARK: View + ViewModel

struct ContentView: View {
    @EnvironmentObject private var storeModel: StoreModel

    private func populateProducts() async {
        do {
            try await storeModel.populateProducts()
        } catch {
            print(error)
        }
    }

    var body: some View {
        VStack {
            List(storeModel.products) { product in
                Text(product.title)
                Text("$\(product.price)")
            }
        }.task {
            await populateProducts()
        }
        .padding()
    }
}

#Preview {
    ContentView().environmentObject(StoreModel(webservice: WebService()))
}
