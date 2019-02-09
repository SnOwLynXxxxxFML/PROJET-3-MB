//
//  Character.swift
//  PROJET 3
//
//  Created by Marie BITTER on 12/12/2018.
//  Copyright © 2018 MarieBitter. All rights reserved.
//


//description of characters

class Character {     // Mother Class
    
    // Characters' Properties
    var characterName: String    // name of the character
    var characterWeapon: Weapon = BareHands(weaponName: "BareHands")      // Weapon of the character, BareHands by default
    var characterMaxLife = 100     // Maximum life of the character : at the beginning of the game
    var characterLife = 0          // Life of the character during the game
    var isAMageOfWinterhold = false     // bool to check if the character is a Mage (only true for the Mage Of Winterhold)
    
    
    init(characterName: String) {
        self.characterName = characterName
    }
    
    
// Characters' Methods :
   //  Character's Description
   //  Function to describe the character : name, life, weapon, weapon damage
    func characterDescription() {
                print("Here are the characteristics of your character :"
                    + "\n - Name of your character: \(characterName)"
                    + "\n - Life points of your character: \(characterLife)"
                    + "\n - Weapon of your character: \(characterWeapon.weaponName)"
                    + "\n - Weapon Damage (for fighters) or Healing Power (for the Mage Of Winterhold) : \(characterWeapon.weaponDamage)"
                    + "\n - NB : Only the MageOfWinterhold can heal and the other Characters are fighters" )
        
    }
    
    // This fonction checks if the chosen Character is alive and if target (vsCharacter) is alive. According to characterType, the life of the target reduces by the damage of the Character's Weapon.
    func attack(vsCharacter: Character) {
        if characterLife > 0 {
            if vsCharacter.characterLife <= 0 {
                print("You are trying to attack a dead character ! MALAKA YOU WUSS !!!" + "\n ")
            } else {
                vsCharacter.characterLife -= characterWeapon.weaponDamage
            }
            if vsCharacter.characterLife <= 0 {
               vsCharacter.characterLife  = 0
            }
            print("\(characterName) attacked \(vsCharacter.characterName) with his \(characterWeapon) and destroyed \(characterWeapon.weaponDamage) life points ! " + "\n ")
            if vsCharacter.characterLife == 0 {
                print("\(vsCharacter.characterName) is dead ☠️ ! ")
            }
        } else {
            print("Sorry, you are very much dead  ! You can't attack !" + "\n ")
        }
    }
    
    func heal(vsCharacter: Character) { // for the MageOfWinterhold
        if isAMageOfWinterhold == true {
            if characterLife > 0 {
                if vsCharacter.characterLife <= 0 {
                    print(" ☠️☠️☠️☠️ You are trying to resurrect a dead character ☠️☠️☠️☠️ It is forbidden by the High Council Of Wintherhold !!! " + "\n ")
                } else {
                    vsCharacter.characterLife += characterWeapon.weaponDamage
                }
                print("\(characterName) healed \(vsCharacter.characterName) with his \(characterWeapon) and restored \(characterWeapon.weaponDamage) life points ! " + "\n ")
            } else {
                print("Sorry, you are very much dead ! You can't heal anyone !" + "\n ")
            }
        }
    }
} // end of Class Character
