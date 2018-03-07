//
//  ViewController.swift
//  Apaya
//
//  Created by IdeKreasi on 03/03/18.
//  Copyright © 2018 ImNoTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    let emojis: [Int: String] = [1: "🐧", 2: "🦄", 3: "🐿", 4: "🐣", 5: "🐵", 6: "🦖"]
    
    lazy var game = Apaya(numberOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let index = cardButtons.index(of: sender) {
            flipCount += 1
            game.chooseCard(at: index)
            updateViewFromModel()
            flipCountLabel.text = "Flip counts \(flipCount)"
        } else {
            fatalError("This card is not included in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(getEmoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            }
        }
    }
    
    func getEmoji(for card: Card) -> String {
        guard let emoji = emojis[card.identifier] else {
            fatalError("The emoji available is fewer than cards")
        }
        
        return emoji
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}


