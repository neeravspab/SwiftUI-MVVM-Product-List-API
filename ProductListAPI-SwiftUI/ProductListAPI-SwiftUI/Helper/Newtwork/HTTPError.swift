//
//  HTTPError.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/13/23.
//

import Foundation

enum HttpError: Error {
    case badRequest
    case InvalidRequest
    case authenticationError
    case serverSideError
    case failed
}
