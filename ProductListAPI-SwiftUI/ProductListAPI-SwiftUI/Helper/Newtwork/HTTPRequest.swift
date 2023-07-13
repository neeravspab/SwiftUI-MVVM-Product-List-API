//
//  HTTPRequest.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/13/23.
//

import Foundation

//Type Alias For complition Hendler
typealias Handler<T> = (Result<T, Error>) -> Void

// This is escaping for viewmodel to infrom view to update data.
enum ComplitionResult {
    case dataloaded
    case datafail
}

// HTTTPRequest Components
protocol RequestComponents {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPRequestMethod { get }
}

// HTTTPURL Request Components

struct URLRequestComponents {
    var components: RequestComponents
}

protocol HTTPRequestProtocal {
    func performRequest<T: Codable>(urlrequest: URLRequestComponents, modelType: T.Type, completion: @escaping Handler<T>)
}

// HTTP Request Class
final class HTTPRequest:HTTPRequestProtocal {
    
    // API Request
    /// -Parameter
    /// argument 1:  urlrequestcomponent which includes url path name and parameter if required
    /// Argument 2:  model name
    
    func performRequest<T: Codable>(urlrequest: URLRequestComponents, modelType: T.Type, completion: @escaping Handler<T>) {
        
        if Reachability.isConnectedToNetwork() {
            // Fetch Url And Components From ViewModel
            guard let url = urlrequest.components.url else {
                completion(.failure(HttpError.badRequest))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = urlrequest.components.method.rawValue
            
            print("URL: \(url)")
            
            // Performs HTTP Data Task
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data, error == nil else {
                    completion(.failure(HttpError.InvalidRequest))
                    return
                }
                // Perform Network Error Handling
                if let error = self.getHTTPNetworkError(for: response as! HTTPURLResponse) {
                    print(error.localizedDescription)
                    completion(.failure(error))
                } else {
                    do {
                        // Decode responsedata to Expactred Model Type
                        let response = try JSONDecoder().decode(modelType.self, from: data)
                        completion(.success(response))
                        
                    }catch {
                        print(error.localizedDescription)
                        completion(.failure(HttpError.failed))
                    }
                }
            }.resume()
        } else {
            // POP UP Network Error Alert
           
        }
    }
    
    //  Function to Check errror by  network Response status code
    
    func getHTTPNetworkError(for response: HTTPURLResponse) -> HttpError? {
        switch response.statusCode {
        case 200...299: return nil
        case 401: return HttpError.authenticationError
        case 400...499: return HttpError.badRequest
        case 500...599: return HttpError.serverSideError
        default: return HttpError.failed
        }
    }
}

