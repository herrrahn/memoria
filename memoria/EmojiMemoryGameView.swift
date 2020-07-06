//
//  EmojiMemoryGameView.swift
//  memoria
//
//  Created by Rafael Rahn on 04.07.20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(items: viewModel.cards) { card in
                CardView(card: card)
                    //.aspectRatio(0.5, contentMode: .fit)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                }
        .padding(5)
        }
        .foregroundColor(Color.green)
        .padding()
//            .font(Font.largeTitle)
//            .edgesIgnoringSafeArea([.top, .bottom])

    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
            RoundedRectangle(cornerRadius: conerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: conerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
                
            } else {
                RoundedRectangle(cornerRadius: conerRadius).fill()
            }
        }
        .font(Font.system(size: min(size.width, size.height) * fontScaleFactor))
    }
    
    // MARK: - Drawing Constants
    let conerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    let cardsAspectRatio: CGFloat = 2
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
