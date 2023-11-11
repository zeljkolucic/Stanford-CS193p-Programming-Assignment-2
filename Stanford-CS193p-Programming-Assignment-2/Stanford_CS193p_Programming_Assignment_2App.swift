//
//  Stanford_CS193p_Programming_Assignment_2App.swift
//  Stanford-CS193p-Programming-Assignment-2
//
//  Created by Zeljko Lucic on 11.11.23..
//

import SwiftUI

@main
struct Stanford_CS193p_Programming_Assignment_2App: App {
    @StateObject private var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
