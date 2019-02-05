//
//  MageOfWinterhold.swift
//  PROJET 3
//
//  Created by Marie BITTER on 05/01/2019.
//  Copyright © 2019 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Character : class MageOfWinterhold
class MageOfWinterhold: Character {
    
    override init(characterName: String) {
        super.init(characterName: characterName)
        isAMageOfWinterhold = true
        characterWeapon = MagicWand()
        characterMaxLife = 80
        characterLife = characterMaxLife
    }
    
}  // end of Class MageOfWinterhold
