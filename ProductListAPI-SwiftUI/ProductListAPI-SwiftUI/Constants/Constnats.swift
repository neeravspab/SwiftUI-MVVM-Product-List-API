//
//  Constnats.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/13/23.
//

import Foundation
import UIKit

struct Constants {
    
    static let baseURL = "https://fakestoreapi.com/"
    static let window =  UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
    static let nodataavailable = "No data available.\n Something went wrong. Please try again."
}

