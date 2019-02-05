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
    
    // Team's PROPERTIES :
    
    var nameTag = ""                                   // nickname of the player
    var teamName: String                               // name of the team
    var teamFighters = [Character]()                   // members of the team are in a tab of type Character
    var teamLife: Int {                                // calculated propriety = sum of each character life in the team
        get {
           var totalLife = 0
            for i in 0..<teamFighters.count {
                totalLife += teamFighters[i].characterLife
            }
         return totalLife }
    }
    var isOnlyComposedOfMageOfWinterhold = false       // bool to know if the team is only composed of MageOfWinterhold, 'false' by default
    
    
    init(teamName: String) {                           // initialization of team's properties
        self.teamName = teamName
    }
    
    // Team's METHODS : teamStatFighter()
    
    // Function that gives the stat of the chosen fighter
    func teamStatFighter() {
        
        for i in 0..<teamFighters.count {                       // loop to read the tab teamFighters
            let fighter = teamFighters[i]
            if fighter.characterLife >= 1 {                     // the character is alive
                if fighter is NorthWarrior || fighter is ForestDwarf || fighter is OrcGiant {
                    print("\(fighter) : life points = \(fighter.characterLife) ; weapon's damage = \(fighter.characterWeapon.weaponDamage)")
                } else if fighter is MageOfWinterhold {
                    print("\(fighter) : life points = \(fighter.characterLife) ; healing power = \(fighter.characterWeapon.weaponDamage)")
                }
            } else {
                print("Your \(fighter) is dead")              // the character is dead
            }
        }
    } // end of function teamStatFighter()
    
}  // end of Class Team
