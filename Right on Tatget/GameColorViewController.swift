//
//  GameColorViewController.swift
//  Right on Tatget
//
//  Created by Чаусов Николай on 16.02.2022.
//

import UIKit

class GameColorViewController: UIViewController {

    var tittleButton:String!
    var colorOfButton:UIColor!
    var arrayOfColors:[(UIColor, [CGFloat])]?
    var roundCounter: Int = 0
    var score: Int = 0
    
    
    @IBOutlet var arrayOfButtonOutlets: [UIButton]!
    @IBOutlet weak var labelRandomHEX: UILabel!
    @IBOutlet weak var buttonsStack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        startRound()
    }
    
 
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // Here is a bug with VStack if landscape changed at previous screnn
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape{
            buttonsStack.axis = .horizontal
        } else {
            buttonsStack.axis = .vertical
        }
    }
    
    func startRound(){
        arrayOfColors = []
        var i = 0
        for button in arrayOfButtonOutlets{
            arrayOfColors?.append(getRandomColor())
            button.backgroundColor = arrayOfColors![i].0
            i += 1
        }
        
        let randomButton = Int.random(in: 0...3)
        tittleButton = arrayOfButtonOutlets[randomButton].titleLabel?.text
        colorOfButton = arrayOfButtonOutlets[randomButton].backgroundColor
        let redColor = Int(arrayOfColors![randomButton].1[0]*255)
        let greenColor = Int(arrayOfColors![randomButton].1[1]*255)
        let blueColor = Int(arrayOfColors![randomButton].1[2]*255)
        
        labelRandomHEX.text = "Узнайте: #" + String(redColor, radix: 16).uppercased() + String(greenColor, radix: 16).uppercased() + String(blueColor, radix: 16).uppercased()

    }
    
    func getRandomColor() -> (UIColor, [CGFloat]){
        let red = CGFloat(Double.random(in: 0...1))
        let green = CGFloat(Double.random(in: 0...1))
        let blue =  CGFloat(Double.random(in: 0...1))
        
        return (UIColor(red: red, green: green, blue: blue, alpha: 1), [red,green,blue])
    }
    
    @IBAction func buttonStackAction(_ sender: UIButton) {
        if sender.titleLabel?.text == tittleButton{
            print("Yes it is!")
            score += 1
        } else {
            print("Wrong answer!")
        }
        roundCounter += 1
        if roundCounter == 5 {
            showAlertWithScore(score: self.score)
            roundCounter = 0
            score = 0
        }
        startRound()
    }
    func showAlertWithScore(score:Int){
        let alert = UIAlertController(title: "Game Over", message: "You have won \(score) points", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
