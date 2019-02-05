//
//  JyrikMagicWand.swift
//  PROJET 3
//
//  Created by Marie BITTER on 27/01/2019.
//  Copyright © 2019 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Weapon : class JyrikMagicWand = Bonus Weapon from the Magic Chest

class JyrikMagicWand: Weapon {
    init() {
        super.init(weaponName: "JyrikMagicWand")
        weaponDamage = 100
    }
} // end of Class JyrikMagicWand
