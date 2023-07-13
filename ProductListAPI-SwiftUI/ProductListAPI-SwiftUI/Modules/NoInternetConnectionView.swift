//
//  NoInternetConnectionView.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/13/23.
//

import SwiftUI

struct NoInternetConnectionView: View {
    
    @State var showView = false

    var body: some View {
        
        VStack {
            Image(systemName: "wifi.slash")
                .resizable()
                .foregroundColor(Color.blue)
                .frame(width: 150, height: 130)
               
            Text("No Internet Connection")
                .font(.title)
                .padding(.top)
            
            Button("Try again") {
                if Reachability.isConnectedToNetwork() {
                    showView = true
                }
            }
            .padding(.top, 20)
            .fullScreenCover(isPresented: $showView) {
                ProductListView()
            }
        }
    }
}

struct NoInternetConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoInternetConnectionView()
    }
}
