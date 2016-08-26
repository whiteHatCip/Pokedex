//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Fabio Cipriani on 25/08/16.
//  Copyright © 2016 Fabio Cipriani. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var EvoViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var IdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImg.image = UIImage(named: "\(pokemon.pokedexID)")
        currentEvoImg.image = mainImg.image
        nameLbl.text = pokemon.name.capitalized
        IdLbl.text = "\(pokemon.pokedexID)"
        pokemon.downloadPokemonDetails {
            self.updateUI()
            self.descriptionLbl.isHidden = false
        }
        
    }
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        
        if pokemon.nextEvolutionID != "" {
            nextEvoImg.isHidden = false
            evoLbl.text = "Next Evolution: " + pokemon.nextEvolutionTxt + " - LVL " + pokemon.nextEvolutionLvl
        } else {
            evoLbl.text = "Next Evolution: None"
            nextEvoImg.isHidden = true
        }
        nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionID)")
        descriptionLbl.text = pokemon.description
    }
    
}
