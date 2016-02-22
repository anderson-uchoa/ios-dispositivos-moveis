//
//  Player.swift
//  
//
//  Created by Anderson Uchôa on 22/02/16.
//
//

import UIKit

struct Player {
    var name: String?
    var game: String?
    var rating: Int
    
    init(name: String?, game: String?, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
    }
}