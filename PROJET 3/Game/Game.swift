    //
    //  Game.swift
    //  PROJET 3
    //
    //  Created by Marie BITTER on 08/12/2018.
    //  Copyright © 2018 MarieBitter. All rights reserved.
    //
    import Foundation
    
    // Creation of class Game
    
    class Game {
        
        // Class Game PROPERTIES :
        
        var firstTeam = Team(teamName: "")                     // first team = instance of Team = team of the first player
        var secondTeam = Team(teamName: "")                    // second team = instance of Team = team of the second player
        var nameOfTheTeam = ""                                 // name of the team
        var teamsCharactersNamesTab = [String]()               // tab with all the character's names
        var characterName = ""                                 // name of the character
        var playerTeamChoice = 0                               // number to choose the members of the team in function createTeam()
        var chosenFighter = Character(characterName: "")       // character chosen by the player to play
        var indexOfCurrentFighter = 0                          // index (int) in the tab of characters corresponding to the chosenFighter
        var tabOfIndexCurrentFighter = [String]()              // tab containing the index (string) of characters of the playing team
        var indexOfTarget = 0                                  // index (int) in the tab of characters of target team
        var tabOfIndexOfTarget = [String]()                    // tab containing the index (string) of characters of the target teams
        
        init() {                                               // initialization of Game's PROPERTIES
        }
        
        // Function startGame() describes a game : contains all of the successive actions (methods) to play the game
        func startGame() {
            print("******** The Game Begins ********" + "\n ")
            displayGameRules()                                                            // Rules of the game
            print("")
            createNameTag()                                                               // Creation of the nicknames of the players
            print("")
            chooseTeamName()                                                              // Creation of the team names
            print("")
            print("================================================="
                + "\n Player One = \(firstTeam.nameTag) : please create your Team"        // Creation of firstTeam
                + "\n ==============================================")
            createTeam(team: firstTeam)
            testIfTeamOfOnlyMageOfWinterhold(team: firstTeam)
            if firstTeam.isOnlyComposedOfMageOfWinterhold == true {                       // if the team is only composed of MageOfWinterhold
                createTeam(team: firstTeam)                                               // we create firstTeam again
            }
            print("")
            print("================================================="
                + "\n Player Two = \(secondTeam.nameTag) : please create your Team"       // Creation of secondTeam
                + "\n ==============================================")
            createTeam(team: secondTeam)
            testIfTeamOfOnlyMageOfWinterhold(team: secondTeam)
            if secondTeam.isOnlyComposedOfMageOfWinterhold == true {                      // if the team is only composed of MageOfWinterhold
                createTeam(team: secondTeam)                                              // we create secondTeam again
            }
            print("")
            introFight()                                                                  // Fight sequence
            print("")
            playFight()
            print("")
            theWinnerIs()                                                                 // Determines the winner
            print("")
            playAgain()                                                                   // Play again ? 
            
        } // end of function startGame()
        
        // Function displayGameRules() : explains the rules of the game
        func displayGameRules() {
            print("Welcome to Bordeciel's World"
                + "\n"
                + "\n Two Teams fight to death with their three characters"
                + "\n Each player chooses a name, then chooses a team of three characters"
                + "\n There are 4 types of character : the NorthWarrior, the MageOfWinterhold, the OrcGiant and the ForestDwarf"
                + "\n MageOfWinterhold can heal et restore life points, the other three can attack"
                + "\n Each turn, one player chooses one character from their team, then chooses one character of the opponent's team to attack, or one of their own character to heal with the MageOfWinterhold")
            
        } // end of function displayGameRules()
        
        
        // Function createNameTag() : the players choose a NameTag
        func createNameTag() {
            var nameTag = String()
            
            for i in 0...1 {                                          // loop for player 1 and player 2 to choose a NameTag
                
                repeat {                                              // the instruction is repeated while players don't choose NameTag
                    print("player \(i+1): choose a NameTag")          // player 1 is playing
                    if i == 0 {
                        nameTag = readLine()!
                        if nameTag == "" {                            // the player didn't write anything
                            print("please choose no empty string")
                        }
                        else {
                            firstTeam.nameTag = nameTag               // the name is the nickname of player 1
                        }
                    }
                    else if i == 1 {                                  // player 2 is playing (same thing)
                        nameTag = readLine()!
                        if nameTag == "" {
                            print("please choose no empty string")
                        }
                        else {
                            secondTeam.nameTag = nameTag               // the name is the nickname of player 2
                        }
                    }
                    print("")
                    
                } while nameTag == ""
                print("OK : It's a Great Name !")
                print("")
            }
            
        } // end of function createNameTag()
        
        
        // Function chooseTeamName() : the players choose a team name
        func chooseTeamName() {
            
            for i in 0...1 {                                           // loop for 2 players : asking to choose a TeamName
                
                repeat {                                               // repeat instruction until the player chooses a Team Name
                    print("player \(i+1): choose a teamName")
                    if i == 0 {                                        // player 1 is playing
                        nameOfTheTeam = readLine()!
                        if nameOfTheTeam == "" {                       // the player didn't write anything
                            print("please choose no empty string")
                        }
                        else {
                            firstTeam.teamName = nameOfTheTeam          // nameOfTheTeam is the name of the first team
                        }
                    }
                    if i == 1 {                                         // player 2 is playing (same thing)
                        nameOfTheTeam = readLine()!
                        if nameOfTheTeam == "" {
                            print("please choose no empty string")
                        }
                        else {
                            secondTeam.teamName = nameOfTheTeam         // nameOfTheTeam is the name of the first team
                        }
                    }
                    
                } while nameOfTheTeam == ""
                print("OK it is a great team name ! You will win for sure !")
                print("")
            }
            
        } // end of function chooseTeamName()
        
        
        // Function displayTeamMenu() : display characteristics of the types of characters and asks the player to choose a character
        func displayTeamMenu() {
            print(""
                + "\n There are four types of characters : 1-NorthWarrior, 2-MageOfWinterhold, 3-OrcGiant, 4-ForestDwarf "
                + "\n 1-The NorthWarrior is a fighter - Life: 100 / Weapon(FireSword) Damage: 10 "
                + "\n 2-The MageOfWinterhold can cure the members of his team - Life: 80 / Weapon(MagicWand) Heal: 30 "
                + "\n 3-The OrcGiant is big and tough, but he doesn't make a lot of damage - Life: 200 / Weapon(OrcCudgel) Damage: 3 "
                + "\n 4-The ForestDwarf his axe make a lot of damage, but he doesn't have a lot of life points - Life: 40 / Weapon(WoodenAxe) Damage: 30 "
                + "\n "
                + "\n Choose a Character by typing a number between 1 and 4")
        } // end of function displayTeamMenu()
        
        
        // Funtion input() : function to interact with Player
        func input() -> Int {
            let strData = readLine();
            
            return Int(strData!)!
        } // end of function input()
        
        
        // Function createTeam() : with a parameter of type Team (that can be firstTeam or secondTeam)
        // The player chooses 3 characters and gives them names
        // A test is made to check that the name of the character is unique
        // The character is added to the tab teamFighters
        func createTeam(team: Team) {
            
            for _ in 0...2 {                                                // loop to create 3 characters
                
                repeat {                                                    // repeat displayTeamMenu while player doesn't choose between 1 and 4
                    displayTeamMenu()
                    playerTeamChoice = input()
                } while playerTeamChoice < 1 || playerTeamChoice > 4        // the player chooses the type of character
                
                repeat {
                    print("What is the name of your character ?")
                    characterName = readLine()!
                } while characterName == ""                                 // the player gives a name to the character
                
                testIfCharacterNameIsUnique()                               // function to test if the chosen name is unique
                
                switch playerTeamChoice {                                   // add the character type and name to the tab teamFighters
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
            } // end of loop
            
        } // end of function createTeam()
        
        
        // Function testIfCharacterNameIsUnique() : the characterName is added in a tab containing all the names
        // if the tab already contains the name, the player has to choose another characterName
        func testIfCharacterNameIsUnique() {
            if teamsCharactersNamesTab.contains(characterName) {
                repeat {                                                                          // the instruction is repeated
                    print("This name is already taken, please choose an other name")
                    print("What is the name of your Character ?")
                    characterName = readLine()!                                                   // while the player leaves a blank
                } while teamsCharactersNamesTab.contains(characterName) || characterName == ""    // or chooses a name already taken
            } else {
                print("")
            }
            teamsCharactersNamesTab.append(characterName)                                         // the name is added to the tab of character names
        
        } // end of function testIfCharacterNameIsUnique()
        
        
        // function testIfTeamOfOnlyMageOfWingterhold() : test if team is only composed of MageOfWinterhold
        func testIfTeamOfOnlyMageOfWinterhold(team : Team) {
            var numberOfMageOfWinterhold = 0                           // counts the number of MagesOfWinterhold
    
            for character in team.teamFighters {                       // loop "reading" the tab teamFighters
                if character.isAMageOfWinterhold {
                    numberOfMageOfWinterhold += 1                      // add +1 if it is a MageOfWinterhold
                }
            }
        
            if numberOfMageOfWinterhold == 3 {                         // If only MageOfWinterhold on the team
                print("This is not the fortress of Winterhold : You can't have a team of only Mages ! You need fighters ! Let's create the team again.")
                team.isOnlyComposedOfMageOfWinterhold = true           // bool isOnlyComposedOfMageOfWinterhold becomes true
            }
        }
        
       // END OF CREATION OF THE NAME TAGS AND THE TEAMS
        
        
        
        // Function introFight() : introduction text before fight sequence
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
        } // end of function introFight()
        
        
        // Function playFight() : player 1 plays, then player 2, until one team is dead
        func playFight() {
            repeat {                                                                     // Player 1 is playing first
                if firstTeam.teamLife > 0 {                                              // checks if firstTeam is alive
                    statsTeams()                                                         // display statistics one the teams
                    print("")
                    
                    print(" ***** \(firstTeam.nameTag) : IT'S YOUR TURN ! ***** ")
                    randomDragon(team: firstTeam, vsOpposingTeam: secondTeam)            // random event
                    chooseFighter(from: firstTeam)                                       // player 1 chooses a character from firstTeam
                    print("")
                    magicChest(opensBefore: chosenFighter)                               // random magic chest with special weapon
                    print("")
                    attackOrHeal(team: firstTeam, vs: secondTeam)                        // attack or heal
                    print("")
                }
                                                                                         // Player 2 is playing (same thing)
                if secondTeam.teamLife > 0 {
                    statsTeams()
                    print("")
                    
                    print(" ***** \(secondTeam.nameTag) : IT'S YOUR TURN ! ***** ")
                    randomDragon(team: secondTeam, vsOpposingTeam: firstTeam)
                    chooseFighter(from: secondTeam)
                    print("")
                    magicChest(opensBefore: chosenFighter)
                    print("")
                    attackOrHeal(team: secondTeam, vs: firstTeam)
                    print("")
                }
            } while firstTeam.teamLife > 0 && secondTeam.teamLife > 0
        
        } // end of function playFight()
        
        
        // Function statsTeams() : Displays team statistics
        func statsTeams() {
            print(" ***** \(firstTeam.nameTag) : here is your team \(firstTeam.teamName) ***** " + "\n ")  // stats of firstTeam
            firstTeam.teamStatFighter()                                                                    // uses method teamStatFighter in class Team
            
            print("")
            print(" ***** \(secondTeam.nameTag) : here is your team \(secondTeam.teamName) ***** " + "\n ")  // stats of secondTeam
            secondTeam.teamStatFighter()
            
        } // end of function statsTeams()
        
        
        // Function chooseFighter() :  asks the player to choose a character from their team to play with
        func chooseFighter(from team : Team) {                                          // label+parameter "from team" : can be firstTeam or secondTeam
            var playerFighterChoice = ""
            
            repeat {
                print(" \(team.nameTag), choose a character from your team" + "\n ")
                for indexOfCurrentFighter in 0..<team.teamFighters.count  {                         // loop to "read" the tab teamFighter
                    print(" \(indexOfCurrentFighter) = \(team.teamFighters[indexOfCurrentFighter].characterName)" )
                }                                                                                   // displays "index" = "characterName"
                tabOfIndexCurrentFighter.append("\(indexOfCurrentFighter)")                         // add index number to the tab of index
                print("Choose the number corresponding to the character you want")
                
                playerFighterChoice = readLine()!                                                   // the player chooses the character to play with
                print("")
            } while playerFighterChoice == "" && !tabOfIndexCurrentFighter.contains("\(indexOfCurrentFighter)")
                                                                                                    // repeat while player leaves a blank
                                                                                                    // or chooses a number not in the tab
            indexOfCurrentFighter = Int(playerFighterChoice)!
            chosenFighter = team.teamFighters[indexOfCurrentFighter]                                // chosenFighter is the selected character
            
        } // end of function chooseFighter()
        
        
        // Function attackOrHeal() with 2 parameters : team (playing team), and opposingTeam
        // If the chosenFighter is a MageOfWinterhold : displays player's own team and the Mage heals the target
        // if the chosenFighter is a Fighter : displays opposing team and the Fighter attacks the target
        func attackOrHeal(team : Team, vs opposingTeam: Team) {
            var playerTargetChoice = ""
            var target: Character
            
            print(" \(team.nameTag) : you chose to play with \(chosenFighter.characterName)")
            if chosenFighter.isAMageOfWinterhold {                                                    // if chosenFighter is a MageOfWinterhold
                repeat {                                                                              // display team + choice of the target
                    print(" \(chosenFighter.characterName) is a Mage of Winterhold : which member of your team would you like to heal ?")
                    for  indexOfTarget in 0..<team.teamFighters.count {                      // loop to "read" the tab teamFighter of the playing team
                        print("\(indexOfTarget) = \(team.teamFighters[indexOfTarget].characterName)")
                        tabOfIndexOfTarget.append("\(indexOfTarget)")                                 // add index number to the tab of index (target)
                    }
                    playerTargetChoice = readLine()!                                                  // player chooses the target
                    print("")
                } while playerTargetChoice == "" && !tabOfIndexOfTarget.contains("\(indexOfTarget)")  // repeat while player leaves a blank
                                                                                                      // or chooses a number not in the tab
                indexOfTarget = Int(playerTargetChoice)!
                target = team.teamFighters[indexOfTarget]                                             // the target is the selected character
                
                chosenFighter.heal(vsCharacter: target)                                               // the MageOfWinterhold heals the target
            }
                
            else {                                                                                    // if the chosenFighter is a fighter
                repeat {                                                                              // display opposing team + choice of the target
                    print(" \(chosenFighter.characterName) is a fighter : who would you like to attack ?")
                    for  indexOfTarget in 0..<opposingTeam.teamFighters.count {            // loop to "read" the tab teamGighters of the opposing team
                        print("\(indexOfTarget) = \(opposingTeam.teamFighters[indexOfTarget].characterName)")
                        tabOfIndexOfTarget.append("\(indexOfTarget)")                                  // same thing
                    }
                    playerTargetChoice = readLine()!
                    print("")
                } while playerTargetChoice == "" && !tabOfIndexOfTarget.contains("\(indexOfTarget)")
                
                indexOfTarget = Int(playerTargetChoice)!
                target = opposingTeam.teamFighters[indexOfTarget]
                
                chosenFighter.attack(vsCharacter: target)                                               // the fighter attacks the target
            }
            
        }        // end of function attackOrHeal()
        
        
        // Function theWinnerIs() : Displays the Winner of the rpg, the first player with 3 dead characters loses.
        func theWinnerIs() {
            if firstTeam.teamLife <= 0 {
                print("=======🏆 CONGRATULATIONS \(secondTeam.nameTag) 🏆======="
                    + "\n You crushed \(firstTeam.nameTag) ! You are The Winner Of Bordeciel" )
            }
            else if secondTeam.teamLife <= 0 {
                print("=======🏆 CONGRATULATIONS \(firstTeam.nameTag) 🏆======="
                    + "\n You crushed \(secondTeam.nameTag) ! You are The Winner Of Bordeciel" )
            }
        } // end of function theWinnerIs()
        
        
        // Function MagisChest() : a Magic Chest appears randomly before the chosenFighter (parameter of type Character)
        // A special and powerful Weapon is inside
        func magicChest(opensBefore: Character) {
            let randomNumber = Int.random(in: 1 ... 5)                                     // 1 chance out of 5 to have a magicChest
            if randomNumber == 3 {
                print(" ⚔️===== Waouhhhh a MagicChest appears in front of you =====⚔️ "
                    + "\n \(chosenFighter.characterName), open the Magic Chest !")
                if chosenFighter.isAMageOfWinterhold == true {                             // if the chosenFighter is a MageOfWinterholf
                    print(" \(chosenFighter.characterName),"
                        + "\n As a MageOfWinterhold you receive the Jirik Magic Wand : it is a very rare Wand, it used to belong to the famous Lord Jirik Gauldur, the most powerful Mage Of Winterhold in the Old Times."
                        + "\n It will restore 100 life points. As of this moment, you will keep this wand as your weapon.")
                    chosenFighter.characterWeapon = JyrikMagicWand()                       // the character has a new healing weapon : JyrikMagicWand
                }
                else{                                                                      // if the chosenFighter is a Fighter
                    print("\(chosenFighter.characterName),"
                        + "\n You are a fighter : you receive the DaedricSword : a legendary weapon ! It is the most powerful sword of Bordeciel"
                        + "\n It will cause 55 damage points ! As of this moment, you will keep the sword as your weapon.")
                    chosenFighter.characterWeapon = DaedricSword()                         // the character has a new weapon : DeadricSword
                }
            }
        } // end of function magicChest()
        
        
        // Function randomDragon() : BONUS to make it more fun
        // The function has 2 parameters : team = the playing team, and vsOpposingTeam = the opposing team
        func randomDragon(team: Team, vsOpposingTeam: Team) {
            let randomNumber = Int.random(in: 1...10)                      // Random apparition of 2 types of Dragons
            var playerChoice: String
            if randomNumber == 2 {                                         // 1 chance out of 10 : the dragon ALDUIN appears
                print("A shadow surrounds you, the wind blows harder. You turn around and here is the Legendary Dragon ALDUIN !"
                    + "\n Alduin is the Devourer Of The World, he can destroy your opponent's team, making you the winner of this game, or he can fly away"
                    + "\n \(team.nameTag) Press ENTER to see what happens")
                repeat { playerChoice = readLine()!
                } while playerChoice != ""
                let secondRandomNumber = Int.random(in: 1...5)             // if Alduin appeared : 1 chance out of 5 = he destroys the opposing team !
                if secondRandomNumber == 3 {
                    print("Alduin takes a deep breath ... and SPITS FIRE ON TEAM \(vsOpposingTeam.teamName)! They are all dead, Alduin sent them to the Other World.")
                    for i in 0..<vsOpposingTeam.teamFighters.count  {
                        vsOpposingTeam.teamFighters[i].characterLife = 0   // life points of characters in the opposing team are = 0
                    }
                } else {                                                   // if Alduin appears : 4 chances out of 5 = he goes away
                    print("Alduin takes a deep breath ... and FLY AWAY")
                }
            } else if randomNumber == 6 {                                  // 1 chance out of 10 : the dragon Paarthunax appears
                print("Light suddenly surrounds you, the sun shines through the clouds. You turn around and here is the Legendary Dragon PAARTHURNAX"
                    + "\n Paarthurnax is a kind dragon. He will help you. \(team.nameTag), all the members of your team receive 50 life points, including your dead characters")
                for i in 0..<team.teamFighters.count  {
                team.teamFighters[i].characterLife += 50                   // Adds 50 life points to every members of the team
                }
            } else {                                                       // 8 chances out of 10 : no dragons
                print("You see the shadow of a dragon flying above the battlefield but it disappears")
            }
        } // end of function randomDragons()

        
        // Function playAgain() : asks the players if they want to start another game
        func playAgain() {
            var newGame = ""
            repeat {
                print("This is the end of the game"
                    + "\n Would you like to play again ?"
                    + "\n 1. YES"
                    + "\n 2. NO")
                if let choice = readLine() {
                    newGame = choice
                }
            } while newGame != "1" && newGame != "2"
            
            switch newGame {
            case "1": game.startGame()
            default : break
            }
        } // end of function playAgain()
        
    }  // end of Class Game
    
