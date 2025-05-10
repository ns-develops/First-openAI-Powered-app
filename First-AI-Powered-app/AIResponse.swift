//
//  AIResponse.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-10.
//

import Foundation

class AIResponse {
    
    struct AIResponse: Codeable {
        let id: String
        let object: String
        let created: Int
        let model: String
        let choices: [Choice]
    }
    
}
