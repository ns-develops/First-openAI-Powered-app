//
//  ContentView 2.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-10.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var responseText: String = ""
    @State private var isLoading: Bool = false

    let aiService = AIService()

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your prompt", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            
            AsyncActionButton {
                isLoading = true
                responseText = await aiService.getAIResponse(prompt: inputText)
                isLoading = false
            } label: {
                HStack {
                    if isLoading {
                        ProgressView()
                    }
                    Text(isLoading ? "Loading..." : "Ask AI")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(isLoading ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .disabled(inputText.isEmpty || isLoading)
            .padding(.horizontal)

            ScrollView {
                Text(responseText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}
