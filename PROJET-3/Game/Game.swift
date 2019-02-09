    //
    //  Game.swift
    //  PROJET 3
    //
    //  Created by Marie BITTER on 08/12/2018.
    //  Copyright © 2018 MarieBitter. All rights reserved.
    //
    import Foundation
    
    class Game {
        
        var team = Team(teamName: "")
        var firstTeam = Team(teamName: "")
        var secondTeam = Team(teamName: "")
        var nameOfTheTeam = ""
        var teamsCharactersNamesTab = [String]()
        var characterName = ""
        var playerTeamChoice = 0
        var chosenFighter = Character(characterName: "")
        var indexOfCurrentFighter = 0
        var tabOfIndexCurrentFighter = [String]()
        var indexOfTarget = 0
        var tabOfIndexOfTarget = [String]()
        
        init() {
        }
        
        func startGame() {
            print("******** The Game Begins ********" + "\n ")
            displayGameRules()
            print("")
            createNameTag()
            print("")
            chooseTeamName()
            print("")
            print("================================================="
                + "\n Player One = \(firstTeam.nameTag) : please create your Team"
                + "\n ==============================================")
            createTeam(team: firstTeam)
            testIfTeamOfOnlyMageOfWinterhold(team: firstTeam)
            if firstTeam.isOnlyComposedOfMageOfWinterhold == true {
                createTeam(team: firstTeam)
            }
            print("")
            print("================================================="
                + "\n Player Two = \(secondTeam.nameTag) : please create your Team"
                + "\n ==============================================")
            createTeam(team: secondTeam)
            testIfTeamOfOnlyMageOfWinterhold(team: secondTeam)
            if secondTeam.isOnlyComposedOfMageOfWinterhold == true {
                createTeam(team: secondTeam)
            }
            print("")
            introFight()
            print("")
            playFight()
            print("")
            theWinnerIs()
            print("")
            //playAgain
        }
        
        func displayGameRules() {
            print("Welcome to Bordeciel's World"
                + "\n"
                + "\n Two Teams fight to death with their three characters"
                + "\n Each player chooses a name, then chooses a team of three characters"
                + "\n There are 4 types of character : the NorthWarrior, the MageOfWinterhold, the OrcGiant and the ForestDwarf"
                + "\n MageOfWinterhold can heal et restore life points, the other three can attack"
                + "\n Each turn, one player chooses one character from their team, then chooses one character of the opponent's team to attack, or one of their own character to heal with the MageOfWinterhold")
        }
        
        // This function allows the players to choose a NameTag
        func createNameTag() {
            var nameTag = String()
            
            //I create a loop for player 1 and player 2 to choose a NameTag
            for i in 0...1 {
                //The instruction is repeated while players don't choose NameTag
                repeat {
                    print("player \(i+1): choose a NameTag")
                    if i == 0 {
                        nameTag = readLine()!
                        if nameTag == "" {   // l'utilisateur n'a rien saisi sur la console
                            print("please choose no empty string")
                        }
                        else { // l'utilisateur a choisi un nameTag
                            firstTeam.nameTag = nameTag
                        }
                    }
                    else if i == 1 {
                        nameTag = readLine()!
                        if nameTag == "" {
                            print("please choose no empty string")
                        }
                        else { // l'utilisateur a choisi un nameTag
                            secondTeam.nameTag = nameTag
                        }
                    }
                    print("")
                    
                } while nameTag == ""
                print("OK : It's a Great Name !")
                print("")
            }
        }
        
        // Choose a Team Name
        func chooseTeamName() {
            // create a loop for 2 players asking to choose a TeamName
            for i in 0...1 {
                //repeat instruction until the player chooses a Team Name
                repeat {
                    print("player \(i+1): choose a teamName")
                    if i == 0 {
                        nameOfTheTeam = readLine()!
                        if nameOfTheTeam == "" {
                            print("please choose no empty string")
                        }
                        else {
                            firstTeam.teamName = nameOfTheTeam
                        }
                    }
                    if i == 1 {
                        nameOfTheTeam = readLine()!
                        if nameOfTheTeam == "" {
                            print("please choose no empty string")
                        }
                        else {
                            secondTeam.teamName = nameOfTheTeam
                        }
                    }
                    
                } while nameOfTheTeam == ""
                print("OK it is a great team name ! You will win for sure !")
                print("")
            }
        }
        
        
        // Selection the Character type in the menu
        func displayTeamMenu() {
            print(""
                + "\n There are four types of characters : 1-NorthWarrior, 2-MageOfWinterhold, 3-OrcGiant, 4-ForestDwarf "
                + "\n 1-The NorthWarrior is a fighter - Life: 100 / Weapon(FireSword) Damage: 10 "
                + "\n 2-The MageOfWinterhold can cure the members of his team - Life: 80 / Weapon(MagicWand) Heal: 30 "
                + "\n 3-The OrcGiant is big and tough, but he doesn't make a lot of damage - Life: 200 / Weapon(OrcCudgel) Damage: 3 "
                + "\n 4-The ForestDwarf his axe make a lot of damage, but he doesn't have a lot of life points - Life: 40 / Weapon(WoodenAxe) Damage: 30 "
                + "\n "
                + "\n Choose a Character by typing a number between 1 and 4")
        }
        
        // Function to interact with Player
        func input() -> Int {
            let strData = readLine();
            
            return Int(strData!)!
        }
        
        func createTeam(team: Team) {
            
            for _ in 0...2 {        // loop to create 3 characters
                
                repeat {
                    displayTeamMenu()
                    playerTeamChoice = input()
                } while playerTeamChoice < 1 || playerTeamChoice > 4        // the player chooses the type of character
                
                repeat {
                    print("What is the name of your character ?")
                    characterName = readLine()!
                } while characterName == ""                                 // the player gives a name to the character
                
                testIfCharacterNameIsUnique()          // function to test if the chosen name is unique
                
                switch playerTeamChoice {
                case 1:
                    print("You added a NorthWarrior" + "\n ")
                    team.teamFighters.append(NorthWarrior(characterName: characterName))
                case 2:
                    print("You added a MageofWinterhold" + "\n ")
                    team.teamFighters.append(MageOfWinterhold(characterName: characterName))
                case 3:
                    print("You added an OrcGiant" + "\n ")
                    team.teamFighters.append(OrcGiant(characterName: characterName))
                case 4:
                    print("You added a ForestDwarf" + "\n ")
                    team.teamFighters.append(ForestDwarf(characterName: characterName))
                default:
                    print("I don't understand" + "\n ")
                }
            }
        }
        
        func testIfCharacterNameIsUnique() {
            if teamsCharactersNamesTab.contains(characterName) {
                repeat {
                    print("This name is already taken, please choose an other name")
                    print("What is the name of your Character ?")
                    characterName = readLine()!
                } while teamsCharactersNamesTab.contains(characterName) || characterName == ""
                teamsCharactersNamesTab.append(characterName)
            } else {
                print("")
                teamsCharactersNamesTab.append(characterName)
            }
            
        }
        
        // function to test if team is only composed of MageOfWinterhold
        func testIfTeamOfOnlyMageOfWinterhold(team : Team) {
            var numberOfMageOfWinterhold = 0
            // counts the number of MagesOfWinterhold
            for character in team.teamFighters {
                if character.isAMageOfWinterhold {
                    numberOfMageOfWinterhold += 1
                }
            }
            // If only MageOfWinterhold on the team, we create the team again
            if numberOfMageOfWinterhold == 3 {
                print("This is not the fortress of Winterhold : You can't have a team of only Mages ! You need fighters ! Let's create the team again.")
                team.isOnlyComposedOfMageOfWinterhold = true
            }
        }
        
        
        /* function fight = 1.select a team member -  2. is it a magician or an attacker ? - 3. displays opposite team if it is an attacker and display player's team if it is a magician - 4. attack or heal */
        func introFight() {
            print("\n =================================================="
                + "\n =================================================="
                + "\n Are you ready for the bloodiest fight of the World ?"
                + "\n =================================================="
                + "\n =================================================="
                + "\n 3...2...1..."
                + "\n "
                + "\n **************************************************"
                + "\n ********************** FIGHT *********************"
                + "\n **************************************************"
                + "\n ")
        }
        
        // Displays team statistics
        func statsTeams() {
            print(" ***** \(firstTeam.nameTag) : here is your team \(firstTeam.teamName) ***** " + "\n ")
            for i in 0..<firstTeam.teamFighters.count  {
                print("\(firstTeam.teamFighters[i].characterName) :")
                firstTeam.teamFighters[i].characterDescription()
            }
            print("")
            print(" ***** \(secondTeam.nameTag) : here is your team \(secondTeam.teamName) ***** " + "\n ")
            for j in 0..<secondTeam.teamFighters.count {
                print("\(secondTeam.teamFighters[j].characterName) : ")
                secondTeam.teamFighters[j].characterDescription()
            }
        }
        
        // function to ask the player to choose a character from their team to play with
        func chooseFighter(from team : Team) -> Character {
            var playerFighterChoice = ""
            
            repeat {
                print(" \(team.nameTag), choose a character from your team" + "\n ")
                for indexOfCurrentFighter in 0..<team.teamFighters.count  {
                    print(" \(indexOfCurrentFighter) = \(team.teamFighters[indexOfCurrentFighter].characterName)" )
                }
                tabOfIndexCurrentFighter.append("\(indexOfCurrentFighter)")
                print("Choose the number corresponding to the character you want")
                
                playerFighterChoice = readLine()!
                print("")
            } while playerFighterChoice == "" && !tabOfIndexCurrentFighter.contains("\(indexOfCurrentFighter)")
            
            indexOfCurrentFighter = Int(playerFighterChoice)!
            chosenFighter = team.teamFighters[indexOfCurrentFighter]
            
            return chosenFighter
        }
        
        
        // Function Attack or Heal Cycle
        func attackOrHeal(team : Team, vs opposingTeam: Team) {
            var playerTargetChoice = ""
            var target: Character
            
            print(" \(team.nameTag) : you chose to play with \(chosenFighter.characterName)")
            if chosenFighter.isAMageOfWinterhold {
                repeat {  // display team + choice of the target
                    print(" \(chosenFighter.characterName) is a Mage of Winterhold : which member of your team would you like to heal ?")
                    for  indexOfTarget in 0..<team.teamFighters.count {
                        print("\(indexOfTarget) = \(team.teamFighters[indexOfTarget].characterName)")
                        tabOfIndexOfTarget.append("\(indexOfTarget)")
                    }
                    playerTargetChoice = readLine()!
                    print("")
                } while playerTargetChoice == "" && !tabOfIndexOfTarget.contains("\(indexOfTarget)")
                
                indexOfTarget = Int(playerTargetChoice)!
                target = team.teamFighters[indexOfTarget]
                
                chosenFighter.heal(vsCharacter: target) // the MageOfWinterhold heals the target
            }
                
            else {         // chosenFighter is a fighter
                repeat {    // display opposing team + choice of the target
                    print(" \(chosenFighter.characterName) is a fighter : who would you like to attack ?")
                    for  indexOfTarget in 0..<opposingTeam.teamFighters.count {
                        print("\(indexOfTarget) = \(opposingTeam.teamFighters[indexOfTarget].characterName)")
                        tabOfIndexOfTarget.append("\(indexOfTarget)")
                    }
                    playerTargetChoice = readLine()!
                    print("")
                } while playerTargetChoice == "" && !tabOfIndexOfTarget.contains("\(indexOfTarget)")
                
                indexOfTarget = Int(playerTargetChoice)!
                target = opposingTeam.teamFighters[indexOfTarget]
                
                chosenFighter.attack(vsCharacter: target) // fighter attaks the target
            }
            
            // one character from team is still alive
        }        // end of function attackOrHeal
        
        func playFight() {
            repeat {
                statsTeams()
                print("")
                
                print(" ***** \(firstTeam.nameTag) : IT'S YOUR TURN ! ***** ")
                chooseFighter(from: firstTeam)
                print("")
                attackOrHeal(team: firstTeam, vs: secondTeam)
                print("")
                
                statsTeams()
                print("")
                
                print(" ***** \(secondTeam.nameTag) : IT'S YOUR TURN ! ***** ")
                chooseFighter(from: secondTeam)
                print("")
                attackOrHeal(team: secondTeam, vs: firstTeam)
                print("")
                
            } while firstTeam.teamLife > 0 && secondTeam.teamLife > 0
        }
        
        //Display the Winner of the rpg
        func theWinnerIs() {
            if firstTeam.teamLife <= 0 {
            print("=======🏆 CONGRATULATIONS \(secondTeam.nameTag) 🏆======="
            + "\n You crushed \(firstTeam.nameTag) ! You are The Winner Of Bordeciel" )
            }
            else if secondTeam.teamLife <= 0 {
            print("=======🏆 CONGRATULATIONS \(firstTeam.nameTag) 🏆======="
            + "\n You crushed \(secondTeam.nameTag) ! You are The Winner Of Bordeciel" )
        }
        }
            
        
        // A Randon a chest appears, there is a new Weapon
        func magicChest() {
            
        }
        
        //   A power bonus
        func powerBonus() {
            
        }
    }  // end of Class Game
    
