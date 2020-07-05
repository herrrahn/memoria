//
//  EmojiMemoryGame.swift
//  memoria
//
//  Created by Rafael Rahn on 04.07.20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🐶", "🐒", "🐸"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: - access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - intent(s)
    func choose(card: MemoryGame<String>.Card) {
//        objectWillChange.send()
        model.choose(card: card)
    }
}
