//
//  Character.swift
//  PROJET 3
//
//  Created by Marie BITTER on 12/12/2018.
//  Copyright © 2018 MarieBitter. All rights reserved.
//


class Character {     // Mother Class
    
    // Characters' PROPERTIES :
    
    let characterName: String                     // name of the character
    var characterWeapon: Weapon = BareHands()     // Weapon of the character, BareHands by default
    var characterMaxLife = 100                    // Maximum life of the character : at the beginning of the game
    var characterLife = 0                         // Life of the character during the game
    var isAMageOfWinterhold = false               // bool to check if the character is a Mage (only true for the Mage Of Winterhold)
    
    
    init(characterName: String) {
        self.characterName = characterName
    }
    
    
    // Characters' METHODS : characterDescription(), attack(), heal()
    
    //  Function characterDescription() : Function to describe the character : name, life, weapon, weapon damage
    func characterDescription() {
                print("Here are the characteristics of your character :"
                    + "\n - Name of your character: \(characterName)"
                    + "\n - Life points of your character: \(characterLife)"
                    + "\n - Weapon of your character: \(characterWeapon.weaponName)"
                    + "\n - Weapon Damage (for fighters) or Healing Power (for the Mage Of Winterhold) : \(characterWeapon.weaponDamage)"
                    + "\n - NB : Only the MageOfWinterhold can heal and the other Characters are fighters" )
        
    }
    
    // Function attack() : the parameter is the target (type Character)
    // The Function checks if the chosen Character is alive and if target (vsCharacter) is alive. The life of the target reduces by the damage of the Character's Weapon.
    func attack(vsCharacter: Character) {                  // for characters who are fighters
        if characterLife > 0 {                             // the playing character is alive
            if vsCharacter.characterLife <= 0 {            // the target is dead
                print("You are trying to attack a dead character ! MALAKA YOU WUSS !!!" + "\n ")
            } else {                                       // the target is alive : the character attacks
                vsCharacter.characterLife -= characterWeapon.weaponDamage
            }
            if vsCharacter.characterLife <= 0 {            // if the life of the target is < 0 after the attack, it becomes = 0
               vsCharacter.characterLife  = 0
            }
            print("\(characterName) attacked \(vsCharacter.characterName) with his \(characterWeapon.weaponName) and destroyed \(characterWeapon.weaponDamage) life points ! " + "\n ")                   // Story of the attack
            if vsCharacter.characterLife == 0 {
                print("\(vsCharacter.characterName) is dead ☠️ ! ")
            }
        } else {                                           // the playing character is dead and can't attack
            print("Sorry, you are very much dead  ! You can't attack !" + "\n ")
        }
    } // end of function attack()
    
    
    // Function heal() : the partameter is the target (type Character)
    // The function works the same as the function attack() but can only be used by MageOfWinterhold to heal = add life points
    func heal(vsCharacter: Character) {                    // for the MageOfWinterhold
        if isAMageOfWinterhold == true {                   // condition with boolean to check that the character is a MageOfWinterhold
            if characterLife > 0 {
                if vsCharacter.characterLife <= 0 {
                    print(" ☠️☠️☠️☠️ You are trying to resurrect a dead character ☠️☠️☠️☠️ It is forbidden by the High Council Of Wintherhold !!! " + "\n ")
                } else {
                    vsCharacter.characterLife += characterWeapon.weaponDamage
                }
                print("\(characterName) healed \(vsCharacter.characterName) with his \(characterWeapon.weaponName) and restored \(characterWeapon.weaponDamage) life points ! " + "\n ")
            } else {
                print("Sorry, you are very much dead ! You can't heal anyone !" + "\n ")
            }
        }
    } // end of funtion heal()
    
} // end of Class Character
