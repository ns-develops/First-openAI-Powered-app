//
//  First_AI_Powered_appApp.swift
//  First-AI-Powered-app
//
//  Created by Natalie S on 2025-05-09.
//

import SwiftUI

@main
struct First_AI_Powered_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
