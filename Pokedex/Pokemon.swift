//
//  Pokemon.swift
//  Pokedex
//
//  Created by Fabio Cipriani on 25/08/16.
//  Copyright © 2016 Fabio Cipriani. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    fileprivate var _name: String!
    fileprivate var _pokedexID: Int!
    fileprivate var _description: String!
    fileprivate var _type: String!
    fileprivate var _defense: String!
    fileprivate var _height: String!
    fileprivate var _weight: String!
    fileprivate var _attack: String!
    fileprivate var _nextEvolutionTxt: String!
    fileprivate var _nextEvolutionLvl: String!
    fileprivate var _nextEvolutionID: String!
    fileprivate var _pokemonURL: String!
    
    var name: String {
        get {
            return _name
        } set {
            _name = newValue
        }
    }
    
    var pokedexID: Int {
        get {
            return _pokedexID
        } set {
            _pokedexID = newValue
        }
    }
    
    var description: String {
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        } set {
            _description = newValue
        }
    }
    
    var type: String {
        get {
            if _type == nil {
                _type = ""
            }
            return _type
        } set {
            _type = newValue
        }
    }
    
    var defense: String {
        get {
            if _defense == nil {
                _defense = ""
            }
            return _defense
        } set {
            _defense = newValue
        }
    }
    
    var height: String {
        get {
            if _height == nil {
                _height = ""
            }
            return _height
        } set {
            _height = newValue
        }
    }
    
    var weight: String {
        get {
            if _weight == nil {
                _weight = ""
            }
            return _weight
        } set {
            _weight = newValue
        }
    }
    
    var attack: String {
        get {
            if _attack == nil {
                _attack = ""
            }
            return _attack
        } set {
            _attack = newValue
        }
    }
    
    var nextEvolutionTxt: String {
        get {
            if _nextEvolutionTxt == nil {
                _nextEvolutionTxt = ""
            }
            return _nextEvolutionTxt
        } set {
            _nextEvolutionTxt = newValue
        }
    }
    
    var nextEvolutionLvl: String {
        get {
            if _nextEvolutionLvl == nil {
                _nextEvolutionLvl = ""
            }
            return _nextEvolutionLvl
        } set {
            _nextEvolutionLvl = newValue
        }
    }
    
    var nextEvolutionID: String {
        get {
            if _nextEvolutionID == nil {
                _nextEvolutionID = ""
            }
            return _nextEvolutionID
        } set {
            _nextEvolutionID = newValue
        }
    }
    
    var pokemonURL: String {
        get {
            if _pokemonURL == nil {
                _pokemonURL = ""
            }
            return _pokemonURL
        } set {
            _pokemonURL = newValue
        }
    }
    
    init(nome: String, ID: Int) {
        self.name = nome
        self.pokedexID = ID
        self.pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexID)"
    }
    
    func downloadPokemonDetails (completed: DownloadComplete) {
        
        Alamofire.request(pokemonURL, withMethod: .get).responseJSON {
            Response in let result = Response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self.weight = weight
                }
                if let height = dict["height"] as? String {
                    self.height = height
                }
                if let attack = dict["attack"] as? Int {
                    self.attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int {
                    self.defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        self.type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self.type += "/\(name.capitalized)"
                            }
                        }
                    }
                } else {
                    self.type = ""
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] {
                        let descURL = "\(URL_BASE)\(url)"
                        Alamofire.request(descURL, withMethod: .get).responseJSON(completionHandler: { (Response) in
                            let result = Response.result
                            
                            if let descDict = result.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    let newDesc = description.replacingOccurrences(of: "POKMON", with: "pokemon")
                                    
                                    self.description = newDesc
                                    print(self.description)
                                }
                            }
                            completed()
                        })
                    }
                } else {
                    self.description = ""
                }
                
                if let evos = dict["evolutions"] as? [Dictionary<String, AnyObject>], evos.count > 0 {
                    if let evo = evos[0]["to"] as? String {
                        if evo.range(of: "mega") == nil {
                            if let evoLvl = evos[0]["level"] as? Int {
                                self.nextEvolutionLvl = "\(evoLvl)"
                            }
                            if let uri = evos[0]["resource_uri"] as? String {
                                let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let newStr2 = newStr.replacingOccurrences(of: "/", with: "")
                                self.nextEvolutionID = newStr2
                            }
                            self.nextEvolutionTxt = evo
                        } else {
                            self.nextEvolutionLvl = ""
                            self.nextEvolutionID = ""
                        }
                    }
                }
            }
            completed()
        }
    }
}
