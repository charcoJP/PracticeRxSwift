//
//  GitHubRequest.swift
//  PracticeRxSwift
//
//  Created by user on 2018/08/17.
//  Copyright © 2018年 charco. All rights reserved.
//

import Foundation
import APIKit

protocol GitHubRequest: Request where Response: Decodable {
    var decoder: JSONDecoder { get }
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var dataParser: DataParser {
        return JSONDataParser()
    }
    
    var decoder: JSONDecoder {
        return JSONDecoder()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try decoder.decode(Response.self, from: data)
    }
}
