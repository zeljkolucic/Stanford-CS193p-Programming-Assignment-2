//
//  Theme.swift
//  Stanford-CS193p-Programming-Assignment-2
//
//  Created by Zeljko Lucic on 12.11.23..
//

import Foundation

struct Theme {
    let name: String
    let emojis: [String]
    let numberOfPairsOfCards: Int
    let color: String
    
    private init(name: String, emojis: [String], numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = min(emojis.count, numberOfPairsOfCards)
        self.color = color
    }
    
    static func random() -> Theme {
        let index = Int.random(in: 0..<themes.count)
        return themes[index]
    }
    
    private static let themes = [
        Theme(
            name: "Halloween",
            emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"],
            numberOfPairsOfCards: 9,
            color: "orange"
        ),
        Theme(
            name: "Vehicles",
            emojis: ["🚗", "🚜", "🚌", "🛵", "🛴", "🛺", "🚲"],
            numberOfPairsOfCards: 7,
            color: "red"
        ),
        Theme(
            name: "Fruit",
            emojis: ["🍒", "🍓", "🍇", "🍎", "🍉", "🍋", "🍌", "🥝"],
            numberOfPairsOfCards: 8,
            color: "green"
        ),
        Theme(
            name: "Animals",
            emojis: ["🐱", "🐰", "🐶", "🐻", "🐷", "🐴", "🐮", "🐮", "🦆"],
            numberOfPairsOfCards: 6,
            color: "yellow"
        ),
        Theme(
            name: "Vegetables",
            emojis: ["🍆", "🌶️", "🥕", "🥦", "🥔", "🌽", "🧅", "🧄", "🍅"],
            numberOfPairsOfCards: 9,
            color: "purple"
        ),
        Theme(
            name: "Weather",
            emojis: ["☁️", "🌦️", "🌧️", "🌩️", "❄️", "☀️"],
            numberOfPairsOfCards: 6,
            color: "blue"
        )
    ]
}


