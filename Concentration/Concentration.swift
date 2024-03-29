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
    private(set) var cards = [Card]()
    
    private var indexOfOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseeCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOnlyFaceUpCard = index
            }
        }
    }
    
    init(cardPairs: Int) {
        assert(cardPairs > 0, "Concentration.init(at: \(cardPairs)): you must have at least one pair of cards")
        for _ in 0..<cardPairs {
            let card = Card()
            cards += [card, card]
        }
        
        //TODO: Shuffle the cards
    }
}
