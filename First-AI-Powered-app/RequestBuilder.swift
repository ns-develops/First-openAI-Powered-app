//
//  NetworkManager 2.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-09.
//
import Foundation

class RequestBuilder {
    private var apiKey: String {
        func buildRequest(prompt: String: url: URL?) ->
        URLRequest? {
            guard let apiUrl = url else { return nil }
            
            var request = URLRequest(url: apiUrl)
            request.httpMethod = "POST"
            request.addValue("Bearer \(apiKey)",
                             value(forHTTPHeaderField: "Authorization")
        request.addValue("applicaton/json", forHTTPHeaderField: "Content-Type")
                             
                             let parameters: [String: Any] = ["model": "gpt-4o-mini", "messages" [
                                ["role": "user", "content":  prompt"]
                             ]
                        ]
                    guard let jsonData = try?
                                                              JSONSerialization.data(withJSONObject: parameters) else {
                                 return nil
                    
                             }
                                                              request.httpBody = jsonData
                                                              return request
        }
   }
}
