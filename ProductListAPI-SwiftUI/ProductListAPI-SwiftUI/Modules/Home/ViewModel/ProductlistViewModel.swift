//
//  ProductlistViewModel.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/13/23.
//

import Foundation

class ProductListViewModel:ObservableObject {
    
    private let request: HTTPRequestProtocal
    @Published var productlist:[Product] = []
    
    init(request: HTTPRequestProtocal) {
        self.request = request
    }
    
    func getProducts() {
        
        let urlcomponents = URLRequestComponents(components: API.products)
        request.performRequest(urlrequest: urlcomponents, modelType: [Product].self) { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let products):
                    productlist = products
                   
                case .failure(_):
                    print("not loaded")
                }
            }
        }
    }
}
