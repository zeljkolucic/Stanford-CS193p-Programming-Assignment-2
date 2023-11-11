//
//  MemoryGame.swift
//  Stanford-CS193p-Programming-Assignment-2
//
//  Created by Zeljko Lucic on 11.11.23..
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        let id = UUID()
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        init(content: CardContent) {
            self.content = content
        }
    }
}
