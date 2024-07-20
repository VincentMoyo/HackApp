//
//  serviceErrors.swift
//  HackApp
//
//  Created by Aphiwe Shozi on 2024/07/20.
//

import Foundation

enum APIError: String, Error {
    case internalError
    case serverError
    case parsingError
    case invalidURL
}

enum Method {
    case GET
    case POST
}

