//
//  ProductListView.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/12/23.
//

import SwiftUI
import Kingfisher

struct ProductListView: View {
    
    @ObservedObject var productviewModel = ProductListViewModel(request: HTTPRequest())
    
    var body: some View {
        NavigationView {
                        
            ScrollView(.vertical,showsIndicators: false) {
                VStack {
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)) {
                        
                        ForEach(productviewModel.productlist) { product in
                            IteamView(image: KFImage(URL(string: "\(product.image)")), title: product.title, rating: "\(product.rating.rate)", price: "\(product.price)", size: 140)
                        }
                        .padding(.bottom,5)
                    }
                }
                .shadow(color: Color(.systemGray4), radius: 5.0,x: 0,y: 0)
            }
            .padding(.horizontal)
            .navigationTitle("Products")
            .onAppear {
                productviewModel.getProducts()
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
