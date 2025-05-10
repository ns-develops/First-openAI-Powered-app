//
//  Choice.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-10.
//

struct Choice: Codable {
    let index: Int
    let message: Message
    let logprobs: String?
    let finish_reason: String
}

struct Message: Codable {
    let role: String
    let content: String
}
