//
//  SwordOfLegend.swift
//  PROJET 3
//
//  Created by Marie BITTER on 08/01/2019.
//  Copyright © 2019 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Weapon : class DragonBoneSword

class DragonBoneSword: Weapon {
    override init(weaponName: String) {
        super.init(weaponName: "DragonBoneSword")
        weaponDamage = 55
    }
}  // end of Class DragonBoneSword
