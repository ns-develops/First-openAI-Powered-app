//
//  NetworkManager.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-09.
//

import Foundation

class NetworkManager {
    func sendRequest(request: URLRequest) async throws -> Data {
        
        let (responseData, _) = try await URLSession.shared.data(for: request)
   
        return responseData
    }
}
