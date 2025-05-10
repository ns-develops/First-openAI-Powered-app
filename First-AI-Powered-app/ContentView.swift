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
        VStack {
            TextField("Enter your prompt", text:
            $inputText)
            .autocorrectionDisabled()
            .padding()
            .border(Color.gray)
            
            AsyncButton {
                isLoading = true
                responseText = await
                aiService.getAIResponse(prompt:
                inputText)
            isLoading = false
            } label: {
                Text("Ask AI")
                    .padding()
                    .background(isLoading ? Color.gray :
                                    Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
            }
        }
    }
        
}
