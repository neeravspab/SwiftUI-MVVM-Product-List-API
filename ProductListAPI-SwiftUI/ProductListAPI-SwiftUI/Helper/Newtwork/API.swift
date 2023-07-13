//
//  API.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/13/23.
//

import Foundation

enum API {
    case products
}

extension API: RequestComponents {
    
    var path: String {
        switch self {
        case .products: return "products"
        }
    }
    
    var baseURL: String {
        Constants.baseURL
    }
    
    var url: URL? {
        URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPRequestMethod {
        switch self {
        case .products: return .get
        }
    }
}
