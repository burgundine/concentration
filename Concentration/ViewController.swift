//
//  ViewController.swift
//  Concentration
//
//  Created by Burundine B on 10/5/19.
//  Copyright © 2019 Orange. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(cardPairs: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chose card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    
    var emojiChoices = ["👻", "🎃", "🦇", "🕷", "😈", "💀", "🍭"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String  {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
        let randomIndex  = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
    }
        return emoji[card.identifier] ?? "?"
    }
}

