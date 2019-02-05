//
//  Wand.swift
//  PROJET 3
//
//  Created by Marie BITTER on 06/12/2018.
//  Copyright © 2018 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Weapon : class MagicWand

class MagicWand: Weapon {
    init() {
        super.init(weaponName: "MagicWand")
        weaponDamage = 30
    }
} // end of Class MagicWand
