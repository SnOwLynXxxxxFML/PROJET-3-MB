//
//  Sword.swift
//  PROJET 3
//
//  Created by Marie BITTER on 06/12/2018.
//  Copyright © 2018 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Weapon : class FireSword

class FireSword: Weapon {
    init() {
        super.init(weaponName: "FireSword")
        weaponDamage = 10
    }
} // end of Class FireSword
