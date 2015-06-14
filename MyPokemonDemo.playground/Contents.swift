//: Playground - noun: a place where people can play

import UIKit

//This is the Pokemon Base Class

class Pokemon {
  var health = 20
  var level = 1
  let type: String?
  init(type: String) {
    self.type = type
  }
  
  func levelUp() {
    self.level += 1
  }
}

func attackPokemon(attackedPokemon:Pokemon, attackType: String, baseDamage: Int)
{
 //This is the base attack function used by all pokemon classes. Each attack by a pokemon will use the parameters above to modify the attack.
 var vulnerableEnemyType = ""
  switch (attackType) {
    case "Fire":
    vulnerableEnemyType = "Grass"
    break
    case "Grass":
    vulnerableEnemyType = "Water"
    break
    case "Electricity":
    vulnerableEnemyType = "Water"
    break
    case "Rock":
    vulnerableEnemyType = "Fire"
    break
    default:
    vulnerableEnemyType = "None"
    break
  }
  if attackedPokemon.type == vulnerableEnemyType {
    attackedPokemon.health -= (baseDamage * 2)
  }
  else {
    attackedPokemon.health -= baseDamage
  }
}

class Vulpix :Pokemon {
  init(startingLevel: Int?=1) {
    super.init(type: "Fire")
    level = startingLevel!
  }
  
  func emberAttackByPokemonName(attackedPokemon: Pokemon){
    //This is a fire type attack with base damage 3.
    attackPokemon(attackedPokemon, "Fire", 3)
  }
}

class Ninetales : Vulpix {
  func flameBurstAttackByPokemonName(attackedPokemon: Pokemon){
    //This is a fire type attack with base damage 6.
    attackPokemon(attackedPokemon, "Fire", 6)
  }
}

class Bulbasaur : Pokemon {
  init(startingLevel: Int?=1) {
    super.init(type: "Grass")
    level = startingLevel!
  }
  
  func tackleByPokemonName(attackedPokemon: Pokemon) {
    //This is a normal attack with base damage 3.
    attackPokemon(attackedPokemon, "Normal", 3)
  }
}

class Ivysaur : Bulbasaur {
  func razorLeafAttackByPokemonName(attackedPokemon: Pokemon) {
    //This is a grass type attack with base damage 6.
    attackPokemon(attackedPokemon, "Grass", 6)
  }
}

class Venusaur : Ivysaur {
  func solarBeamAttackByPokemonName(attackedPokemon: Pokemon) {
    //This is a grass type attack with base damage 12.
    attackPokemon(attackedPokemon, "Grass", 12)
  }
}

class Pichu : Pokemon {
  init(startingLevel: Int?=1) {
    super.init(type: "Electricity")
    level = startingLevel!
  }
  
  func thunderShockAttackByPokemonName(attackedPokemon: Pokemon) {
    attackPokemon(attackedPokemon, "Electricity", 3)
  }
}

class Pikachu : Pichu {
  func electroBallAttackByPokemonName(attackedPokemon: Pokemon) {
    attackPokemon(attackedPokemon, "Electricity", 6)
  }
}

class Raichu : Pikachu {
  func thunderPunchAttackByPokemonName(attackedPokemon: Pokemon) {
    attackPokemon(attackedPokemon, "Electricity", 12)
  }
}

class Geodude : Pokemon {
  init(startingLevel: Int?=1) {
    super.init(type: "Rock")
  }
  
  func rolloutAttackByPokemonName(attackedPokemon: Pokemon) {
    attackPokemon(attackedPokemon, "Rock", 3)
  }
}

class Graveler : Geodude {
  func rockthrowAttackByPokemonName(attackedPokemon: Pokemon) {
    attackPokemon(attackedPokemon, "Rock", 6)
  }
}

class Golem : Graveler {
  func stoneEdgeAttackByPokemonName(attackedPokemon: Pokemon) {
    attackPokemon(attackedPokemon, "Rock", 12)
  }
}



let myFoxy = Vulpix()
let myBulby = Bulbasaur()
let myIvy = Ivysaur()


myIvy.razorLeafAttackByPokemonName(myFoxy)
myFoxy.health
myIvy.type
myIvy.health
myFoxy.emberAttackByPokemonName(myIvy)
myIvy.health
