//
//  Axe.swift
//  PROJET 3
//
//  Created by Marie BITTER on 06/12/2018.
//  Copyright © 2018 MarieBitter. All rights reserved.
//

import Foundation

// inherinting from Weapon : class WoodenAxe

class WoodenAxe: Weapon {
    override init(weaponName: String) {
        super.init(weaponName: "WoodenAxe")
        weaponDamage = 30
    }
} // end of Class WoodenAxe
