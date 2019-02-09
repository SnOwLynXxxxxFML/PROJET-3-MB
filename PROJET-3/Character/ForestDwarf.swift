//
//  ForestDwarf.swift
//  PROJET 3
//
//  Created by Marie BITTER on 05/01/2019.
//  Copyright © 2019 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Character : class ForestDwarf
class ForestDwarf: Character {
    
    override init(characterName: String) {
        super.init(characterName: characterName)
        characterWeapon = WoodenAxe(weaponName: "WoodenAxe")
        characterMaxLife = 40
        characterLife = characterMaxLife
        
    }
}  // end of Class ForestDwarf

