//
//  NetworkManager 2.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-09.
//


import Foundation

class NetworkManager {
    func sendRequest(request: URLRequest) async throws -> Data {
        // Skicka begäran och få responsdata
        let (responseData, _) = try await URLSession.shared.data(for: request)
        
        // Returnera responsdata
        return responseData
    }
}
