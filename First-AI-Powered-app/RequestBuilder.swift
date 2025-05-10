//
//  NetworkManager 2.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-09.
//
import Foundation

class RequestBuilder {
    private let apiKey = "YOUR API KEY HERE"

    func buildRequest(prompt: String, url: URL?) -> URLRequest? {
        guard let apiUrl = url else { return nil }

        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "model": "gpt-4o",
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            print("Could'nt convert JSON")
            return nil
        }

        request.httpBody = jsonData
        return request
    }

    func sendRequest(prompt: String, completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")
        guard let request = buildRequest(prompt: prompt, url: url) else {
            completion("Failed build request")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          
            if let error = error {
                completion("Network issue: \(error.localizedDescription)")
                return
            }

       
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP-status: \(httpResponse.statusCode)")
            }

      
            guard let data = data else {
                completion("Empty API")
                return
            }

            
            print("Data from API:\n\(String(data: data, encoding: .utf8) ?? "Coulnd not read")")

    
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let choices = json["choices"] as? [[String: Any]],
                   let message = choices.first?["message"] as? [String: Any],
                   let content = message["content"] as? String {
                    completion(content)
                } else {
                    completion("Could not read json answer")
                }
            } catch {
                completion("JSON-fel: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
}
