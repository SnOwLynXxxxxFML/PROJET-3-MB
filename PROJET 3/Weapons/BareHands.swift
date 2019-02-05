//
//  BareHands.swift
//  PROJET 3
//
//  Created by Marie BITTER on 06/12/2018.
//  Copyright © 2019 MarieBitter. All rights reserved.
//

import Foundation


// inherinting from Weapon : class BareHands

class BareHands : Weapon {
    init() {
     super.init(weaponName: "BareHands")
     weaponDamage = 1
    }
} // end of Class BareHands
