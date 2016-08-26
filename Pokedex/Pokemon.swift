//
//  Pokemon.swift
//  Pokedex
//
//  Created by Fabio Cipriani on 25/08/16.
//  Copyright © 2016 Fabio Cipriani. All rights reserved.
//

import Foundation

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
    
    init(nome: String, ID: Int) {
        self.name = nome
        self.pokedexID = ID
    }
}
