//
//  EmojiMemoryGame.swift
//  Stanford-CS193p-Programming-Assignment-2
//
//  Created by Zeljko Lucic on 11.11.23..
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @Published private var game = MemoryGame(numberOfPairsOfCards: 4, cardContentFactory: { pairIndex in
        if emojis.indices.contains(pairIndex) {
            return emojis[pairIndex]
        } else {
            return "‼️"
        }
    })
    
    var cards: [MemoryGame<String>.Card] {
        game.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        
    }
    
    func shuffle() {
        game.shuffle()
    }
}
