
import Foundation

class AIService {
    private let networkManager = NetworkManager() // Din NetworkManager
    private let requestBuilder = RequestBuilder() // Din RequestBuilder
    private let errorMessage = "Error: Unable to generate AI response"
    private let url = URL(string: "https://api.openai.com/v1/chat/completions")!

    func getAIResponse(prompt: String) async -> String {
        guard let request = requestBuilder.buildRequest(prompt: prompt, url: url) else {
            print("[Error] Failed to build request")
            return errorMessage
        }
        
        do {
            let data = try await networkManager.sendRequest(request)
            return decodeResponse(data)
        } catch {
            print("[Error] Failed to send request: \(error.localizedDescription)")
            return errorMessage
        }
    }

    private func decodeResponse(_ data: Data) -> String {
        do {
            let aiResponse = try JSONDecoder().decode(AIResponse.self, from: data)
            return aiResponse.choices.first?.message.content ?? "No response found"
        } catch {
            print("[Error] Failed to decode response: \(error.localizedDescription)")
            return errorMessage
        }
    }
}
