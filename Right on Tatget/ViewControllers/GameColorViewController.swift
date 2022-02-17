//
//  GameColorViewController.swift
//  Right on Tatget
//
//  Created by Чаусов Николай on 16.02.2022.
//

import UIKit

class GameColorViewController: UIViewController {
    
    var gameColor: GameColor!
    
    @IBOutlet var arrayOfButtonOutlets: [UIButton]!
    @IBOutlet weak var labelRandomHEX: UILabel!
    @IBOutlet weak var buttonsStack: UIStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameColor = GameColor(arrayOfButtons: arrayOfButtonOutlets)
        labelRandomHEX.text = gameColor.labelText
        
        changeButtonStackOrientation(for: traitCollection.verticalSizeClass)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        //Will transition == change size of view == change landscape orientation
        super.willTransition(to: newCollection, with: coordinator)
        
        changeButtonStackOrientation(for: newCollection.verticalSizeClass)
    }
    
    @IBAction func buttonStackAction(_ sender: UIButton) {
        if sender.titleLabel?.text == gameColor.tittleButton{
            gameColor.score += 1
        }
        gameColor.roundCounter += 1
        
        if gameColor.roundCounter == 5 {
            showAlertWithScore(score: gameColor.score)
            gameColor.roundCounter = 0
            gameColor.score = 0
        }
        
        gameColor.startRound()
        labelRandomHEX.text = gameColor.labelText
    }
}

extension GameColorViewController {
    func changeButtonStackOrientation(for verticalSizeClass: UIUserInterfaceSizeClass){
        // This function is awesome, UIUserInterfaceSizeClass is saving landscape in enum. Can use it for next times
        if verticalSizeClass == .compact{
            buttonsStack?.axis = .horizontal
        } else {
            buttonsStack?.axis = .vertical
        }
    }
    
    func showAlertWithScore(score:Int){
        let alert = UIAlertController(title: "Game Over", message: "You have won \(score) points", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
}
