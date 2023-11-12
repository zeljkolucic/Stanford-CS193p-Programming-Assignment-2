//
//  MemoryGame.swift
//  Stanford-CS193p-Programming-Assignment-2
//
//  Created by Zeljko Lucic on 11.11.23..
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private(set) var score = 0
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        cards.shuffle()
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { return cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { index in
            if cards[index].isFaceUp {
                if cards[index].numberOfTimesItHasBeenSeen > 0 && !cards[index].isMatched {
                    score -= 1
                }
                cards[index].numberOfTimesItHasBeenSeen += 1
            }
            cards[index].isFaceUp = (newValue == index)
        }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func startNewGame() {
        cards.shuffle()
    }
    
    struct Card: Identifiable, Equatable {
        let id = UUID()
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        fileprivate var numberOfTimesItHasBeenSeen = 0
        
        init(content: CardContent) {
            self.content = content
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
