//
//  NorthWarrior.swift
//  PROJET 3
//
//  Created by Marie BITTER on 05/01/2019.
//  Copyright © 2019 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Character : class NorthWarrior
class NorthWarrior: Character {
    
    override init(characterName: String) {
        super.init(characterName: characterName)
        characterWeapon = FireSword(weaponName: "FireSword")
        characterMaxLife = 100
        characterLife = characterMaxLife
        
    }
}  // end of Class NorthWarrior

