//
//  Team.swift
//  PROJET 3
//
//  Created by Marie BITTER on 06/12/2018.
//  Copyright © 2018 MarieBitter. All rights reserved.
//

import Foundation

// Creation of the class Team
class Team {
    // Each Team as a name and fighters (tab of Characters)
    var teamName: String
    var teamFighters = [Character]()
    var nameTag = ""
    var teamLife: Int {          // calculated propriety = sum of each character life in the team
        get {
           var totalLife = 0
            for i in 0..<teamFighters.count {
                totalLife += teamFighters[i].characterLife
            }
         return totalLife }
    
    }
    var isOnlyComposedOfMageOfWinterhold = false 
    
    
    init(teamName: String) {
        self.teamName = teamName
    }
    
    // Function that gives the stat of the choosen fighter
    func teamStatFighter() {
        
        for i in 0..<teamFighters.count {
            let fighter = teamFighters[i]
            if fighter.characterLife >= 1 {
                if fighter is NorthWarrior || fighter is ForestDwarf || fighter is OrcGiant {
                    print("\(fighter) : life points = \(fighter.characterLife) ; weapon's damage = \(fighter.characterWeapon.weaponDamage)")
                } else if fighter is MageOfWinterhold {
                    print("\(fighter) : life points = \(fighter.characterLife) ; healing power = \(fighter.characterWeapon.weaponDamage)")
                }
            } else {
                print("Your \(fighter) is dead")
            }
        }
    }
}  // end of Class Team
