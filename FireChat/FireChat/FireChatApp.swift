//
//  FireChatApp.swift
//  FireChat
//
//  Created by Hevander Da Costa on 5/7/24.
//


import SwiftUI
import FirebaseCore


@main
struct FireChatApp: App {

    @State private var authManager: AuthManager // <-- Create a state managed authManager property

    init() {
        FirebaseApp.configure()
        authManager = AuthManager() // <-- Initialize the authManager property (needs to be done after FirebaseApp.configure())
    }

    var body: some Scene {
        WindowGroup {
            if authManager.user != nil { // <-- Check if you have a non-nil user (means there is a logged in user)

                    // We have a logged in user, go to ChatView
                    NavigationStack {
                        // We have a logged in user, go to ChatView
                        ChatView() // <-- Add ChatView
                            .environment(authManager)
                            .navigationTitle("Chat")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem {
                                    Button("Sign out") {
                                        authManager.signOut()
                                    }
                                }
                            }
                    }

                } else {
                    // No logged in user, go to LoginView
                    LoginView()
                        .environment(authManager)
            }
        }
    }
}


