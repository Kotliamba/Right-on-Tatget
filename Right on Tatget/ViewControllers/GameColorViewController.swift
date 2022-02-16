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
    @IBOutlet weak var buttonsStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameColor = GameColor(arrayOfButtons: arrayOfButtonOutlets)
        labelRandomHEX.text = gameColor.labelText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeButtonStackOrientation()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // Here is a bug with VStack with horizontal landscape from setup
        super.viewWillTransition(to: size, with: coordinator)
        changeButtonStackOrientation()
    }
    
    @IBAction func buttonStackAction(_ sender: UIButton) {
        if sender.titleLabel?.text == gameColor.tittleButton{
            print("Yes it is!")
            gameColor.score += 1
        } else {
            print("Wrong answer!")
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
    
    func showAlertWithScore(score:Int){
        let alert = UIAlertController(title: "Game Over", message: "You have won \(score) points", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
    func changeButtonStackOrientation(){
        if UIDevice.current.orientation.isLandscape{
            buttonsStack.axis = .horizontal
        } else {
            buttonsStack.axis = .vertical
        }
    }
    

}
