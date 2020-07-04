//
//  MemoryGame.swift
//  memoria
//
//  Created by Rafael Rahn on 04.07.20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
            print("card chosen: \(card)")
    }
    
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
