//
//  Concentration.swift
//  Concentration
//
//  Created by Burundine B on 10/6/19.
//  Copyright © 2019 Orange. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = index
            }
        }
    }
    
    init(cardPairs: Int) {
        for _ in 1...cardPairs {
            let card = Card()
            cards += [card, card]
        }
        
        //TODO: Shuffle the cards
    }
}
