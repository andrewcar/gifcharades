//
//  Phrase.swift
//  GifCharades
//
//  Created by Dulio Denis on 4/21/18.
//  Copyright © 2018 Dulio Denis. All rights reserved.
//

import UIKit

class Phrase {
    let category: String
    let phraseText: String
    let phraseGif: [UIImage]
    
    init(category: String, phraseText: String, phraseGif: [UIImage]) {
        self.category = category
        self.phraseText = phraseText
        self.phraseGif = phraseGif
    }
    
}
