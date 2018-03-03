//
//  ViewController.swift
//  Apaya
//
//  Created by IdeKreasi on 03/03/18.
//  Copyright © 2018 ImNoTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let emojis: [String] = ["🐧", "🦄"]
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let index = cardButtons.index(of: sender) {
            let emoji = getEmoji(fromIndex: index)
            let card = cardButtons[index]
            card.setTitle(emoji, for: .normal)
            card.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            fatalError("This card is not included in cardButtons")
        }
    }
    
    func getEmoji(fromIndex index: Int) -> String {
        if index % 2 == 0 {
            return emojis[0]
        } else {
            return emojis[1]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

