# PROJET-3-MB
Projet 3 - RPG - DAiOS OpenClassrooms 
OPENCLASSROOMS - DAiOS - PROJET 3 


CREATION D’UN JEU VIDEO AVEC SWIFT

Nous allons créer un jeu où deux équipes vont s'affronter dans un combat à mort !

A- PRINCIPE DU JEU

	1- Etape 1 : Les équipes

Au début de la partie, chaque joueur va constituer son équipe en choisissant parmi plusieurs types de personnages. 
- Combattant : L'attaquant classique. Un bon guerrier !
- Mage : Son talent ? Soigner les membres de son équipe.
- Colosse : Imposant et très résistant, mais il ne vous fera pas bien mal
- Nain : Sa hache vous infligera beaucoup de dégâts, mais il n'a pas beaucoup de points de vie.

Consignes :
Chaque équipe doit avoir 3 personnages (peu importe le type).
Les personnages doivent être nommés par les joueurs. Leur nom doit être unique parmi les personnages de la partie.
Le personnage "Combattant" démarre avec 100 points de vie et une épée qui ôte 10 points à son adversaire.
A vous de définir les paramètres des autres personnages !

	2- Etape 2 : Au combat !

Une fois les équipes constituées, la partie démarre. Chacun à son tour, les joueurs effectuent la boucle d'action suivante :

- Choisir un personnage de son équipe
- Choisir un personnage de l'équipe adverse à attaquer ou un personnage de sa propre équipe à soigner dans le cas du Mage.

Le programme va ensuite effectuer l'attaque (ou le soin) et indiquer aux joueurs ce qu'il vient de se passer. 
Lorsqu'un personnage n'a plus de point de vie, il est mort...  Et ne peut pas être réanimé par le mage ! Lorsque tous les personnage d'une équipe sont morts, le joueur a perdu et la partie s'arrête ! 

Avant l'étape 2, il faut donner la liste des personnages de l'équipe adverse avec les propriétés utiles, pour que le joueur puisse faire un choix informé !

	3- Etape 3 : Changeons d'armes !

Rajoutons un peu de piment à la partie. Dans la boucle d'action du joueur décrite précédemment, nous allons ajouter une étape après l'étape 1.

- Choisir un personnage de son équipe
- Un coffre apparaît devant le personnage, il l'ouvre et... il s'équipe d'une nouvelle arme !
- Choisir un personnage de l'équipe adverse à attaquer ou un personnage de sa propre équipe à soigner dans le cas du Mage.

Contraintes : 
Cette nouvelle étape aura lieu aléatoirement pour plus de fun ! 
Chaque personnage ne peut porter qu'une arme à la fois
Le mage ne peut pas recevoir une arme de type Attaque mais seulement de type Soin (et inversement pour les autres personnages)

	4- Bonus 

Faire une application, c'est avant tout de la créativité ! Donc montrez votre créativité en ajoutant une fonctionnalité de votre choix !

Quelques exemples pour vous inspirer :
Un nouveau personnage avec un pouvoir spécial : effrayer, empoisonner, séduire, etc.
Les statistiques du jeu à la fin de la partie (nombre de tours, etc.)
Les personnages ont des types (feu, eau, etc) et sont plus ou moins sensibles à certaines attaques


B - CREATION DU JEU «  BORDECIEL’S WORLD »

	1- Les équipes

La classe Team, représentant une équipe, comporte plusieurs propriétés : 
- de type String : le nameTag (surnom du joueur), le teamName (le nom de l’équipe)
- les combattants de l’équipe sont stockés dans un tableau teamFighters de type Character (classe Character, représentant un personnage)
- La vie de l’équipe est représentée par une variable calculée teamLife, qui est la somme de la vie (var characterLife) de chaque personnage du tableau temFighters

Les équipes sont constituées dans la classe Game. 
2 instances de Team sont créées : firstTeam représentant la première équipe et secondTeam la deuxieme équipe.
La fonction createNameTag() affecte le surnom choisi par le joueur 1 à firstTeam, idem pour le joueur 2 avec secondTeam. 
La fonction chooseTeamName() affecte à firstTeam le nom d'équipe choisi par le joueur 1, idem pour le joueur 2 avec secondTeam.

La fonction createTeam() sert à sélectionner et nommer 3 personnages pour chaque équipe. Elle prend pour paramètre team de type Team qui sera alternativement firstTeam puis secondTeam.
C'est une boucle for qui tourne 3 fois (pour 3 personnages), qui demande de choisir un chiffre correspondant au type de personnage souhaité, puis de taper le nom voulu pour le personnage. 
Ce personnage est ensuite ajoute au tableau teamFighters. 

NB : A SAVOIR
- une fonction testIfCharacterNameIsUnique() a été crée et implémentée dans createTeam() : elle permet de vérifier que le nom choisi pour le personnage n'est pas déjà utilisé.
- une fonction testIfTeamOfOnlyMageOfWinterhold(team : Team) empêche de composer une équipe de 3 mages.


	2- Le combat
  
 La fonction playFight() fait le déroulé de la phase de combat, une boucle repeat while répète le combat jusqu'à ce qu'une équipe soit Game Over.
 La suite d'actions commence pour le joueur 1, puis pour le joueur 2.
 La fonction statsTeams() résume les statistiques des personnages de chaque équipe (points de vie et dégats de l'arme).
 La fonction chooseFighter(from team : Team) permet de sélectionner son combattant.
 Puis la fonction attackOrHeal(team : Team, vs opposingTeam: Team) réalise l'action : les fighters attaquent et les mages soignent. 


	3- Le changement d’arme

Dans la classe Game est crée une fonction magicChest(opensBefore: Character).
Elle est ajoutée a la fonction playFight().
Une variable let randomNumber = Int.random(in: 1 ... 5) permet de choisir aléatoirement un chiffre entre 1 et 5. 
Si randomNumber = 3, un coffre apparait devant le personnage (donc 1 chance sur 5).
Si le personnage est un mage, on lui affecte une nouvelle arme : la Baguette Magique de Jirik, qui peut restaurer 100 points de vie.
Si le personnage est un combattant, il reçoit la Deadric Sword, une épée infligeant 55 points de dégats.


	4- Le bonus 
  
  Il s'agit de fonction randomDragon(team: Team, vsOpposingTeam: Team), dans la classe Game. 
  Elle est ajoutée a la fonction playFight().
  Le fonctionnement est détaillé dans le fichier pdf "Bonus Projet3 DaiOS RPG - MB"
