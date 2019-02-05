//
//  SwordOfLegend.swift
//  PROJET 3
//
//  Created by Marie BITTER on 08/01/2019.
//  Copyright © 2019 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Weapon : class DaedricSword = Bonus Weapon from the Magic Chest

class DaedricSword: Weapon {
    init() {
        super.init(weaponName: "DaedricSword")
        weaponDamage = 55
    }
}  // end of Class DaedricSword
