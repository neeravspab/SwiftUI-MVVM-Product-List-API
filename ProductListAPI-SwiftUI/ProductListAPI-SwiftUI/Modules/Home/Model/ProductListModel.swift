//
//  ProductListModel.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/13/23.
//

import Foundation

struct Product: Codable,Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rate
}

struct Rate: Codable {
    
    let rate: Double
    let count: Int
}
