//
//  AsyncButton.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-10.
//

import SwiftUI

struct AsyncActionButton<Label: View>: View {
    let action: () async -> Void
    let label: Label
    
    @State private var isRunning = false
    
    init(
        action: @escaping () async -> Void,
        @ViewBuilder label: () -> Label
    ) {
        self.action = action
        self.label = label()
    }
    
    var body: some View {
        Button {
            isRunning = true
            Task {
                 await action()
                 isRunning = false
            }
        } label: {
            label
        }
        .disabled(isRunning)  
    }
}
