//
//  ViewController.swift
//  Right on Tatget
//
//  Created by Чаусов Николай on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Game(startValue: 1, endValue: 50, rounds: 5)!
        game.restartGame()
        
        value.text = "\(game.currentSecretValue)"
    }
    @IBAction func trySlider(_ sender: UISlider) {
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        game.calculateScore(with: Int(slider.value))
        if game.isgameEdned {
            showAlertWitchScore(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        value.text = "\(game.currentSecretValue)"
    }
    func showAlertWitchScore(score: Int){
        let alert = UIAlertController(title: "Game Over", message: "You are won \(game.score) points", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Repeat", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

