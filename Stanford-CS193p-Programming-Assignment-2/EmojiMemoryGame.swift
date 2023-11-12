//
//  EmojiMemoryGame.swift
//  Stanford-CS193p-Programming-Assignment-2
//
//  Created by Zeljko Lucic on 11.11.23..
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String>
    private var selectedTheme: Theme
    
    var themeName: String {
        selectedTheme.name
    }
    
    var color: Color {
        switch selectedTheme.color {
        case "orange":
            return .orange
        case "green":
            return .green
        case "red":
            return .red
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        case "blue":
            return .blue
        default:
            return .gray
        }
    }
    
    init() {
        let theme = Theme.random()
        selectedTheme = theme
        game = Self.createMemoryGame(with: theme)
    }
    
    var cards: [MemoryGame<String>.Card] {
        game.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    func startNewGame() {
        let theme = Theme.random()
        selectedTheme = theme
        game = Self.createMemoryGame(with: theme)
    }
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let emojis = theme.numberOfPairsOfCards > theme.emojis.count ? theme.emojis : theme.emojis.shuffled()
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards, cardContentFactory: { pairIndex in
            return emojis[pairIndex]
        })
    }
}
