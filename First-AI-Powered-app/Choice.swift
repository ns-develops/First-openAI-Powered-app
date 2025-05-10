//
//  Choice.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-10.
//

import Foundation

struct Choice: Codable {
    let index: Int
    let message: Message
    let finishReason: String

    enum CodingKeys: String, CodingKey {
        case index
        case message
        case finishReason = "finish_reason"
    }
}
struct Message: Codable {
    let role: String
    let content: String
}
