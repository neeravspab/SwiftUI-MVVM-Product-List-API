//
//  ContentView.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        if Reachability.isConnectedToNetwork() {
            ProductListView()
        } else {
            NoInternetConnectionView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
