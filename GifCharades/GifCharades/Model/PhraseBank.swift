//
//  PhraseBank.swift
//  GifCharades
//
//  Created by Dulio Denis on 4/21/18.
//  Copyright © 2018 Dulio Denis. All rights reserved.
//

import Foundation

class PhraseBank {
    
    var list = [Phrase]()
    
    init() {
        list.append(Phrase(category:"Famous Memes", phraseText: "Can you dig it", phraseGif: []))
        list.append(Phrase(category:"Famous Memes", phraseText: "Come at me bro", phraseGif: []))
        list.append(Phrase(category:"Famous Memes", phraseText: "Haters going hate", phraseGif: []))
        list.append(Phrase(category:"Famous Memes", phraseText: "Dat Ass", phraseGif: []))
        list.append(Phrase(category:"Famous Memes", phraseText: "Shut up and take my money", phraseGif: []))
    }
    
}
