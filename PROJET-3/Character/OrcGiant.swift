//
//  OrcGiant.swift
//  PROJET 3
//
//  Created by Marie BITTER on 05/01/2019.
//  Copyright © 2019 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Character : class OrcGiant
class OrcGiant: Character {
    
    override init(characterName: String) {
        super.init(characterName: characterName)
        characterWeapon = OrcCudgel(weaponName: "OrcVudgel")
        characterMaxLife = 200
        characterLife = characterMaxLife
        
    }
}  // end of Class OrcGiant


