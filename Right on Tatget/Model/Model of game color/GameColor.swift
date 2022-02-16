import Foundation
import UIKit

protocol GameColorProtocol{
    var tittleButton:String! {get}
    var arrayOfColors: [(UIColor, [CGFloat])]! {get}
    var roundCounter: Int {get}
    var score: Int {get}
    
    func startRound()
}

class GameColor: GameColorProtocol{
    var tittleButton: String!
    
    var arrayOfColors: [(UIColor, [CGFloat])]!
    
    var roundCounter: Int = 0
    
    var score: Int = 0
    
    var arrayOfButtonOutlets: [UIButton]!
    
    var labelText = ""
    init(arrayOfButtons: [UIButton]!) {
        self.arrayOfButtonOutlets = arrayOfButtons
        startRound()
    }
    
    func startRound() {
        arrayOfColors = []
        var i = 0
        for button in arrayOfButtonOutlets{
            arrayOfColors?.append(RandomValueGenerator.getRandomColor())
            button.backgroundColor = arrayOfColors![i].0
            i += 1
        }
        
        let randomButton = Int.random(in: 0...3)
        tittleButton = arrayOfButtonOutlets[randomButton].titleLabel?.text
        let redColor = Int(arrayOfColors![randomButton].1[0]*255)
        let greenColor = Int(arrayOfColors![randomButton].1[1]*255)
        let blueColor = Int(arrayOfColors![randomButton].1[2]*255)
        
        labelText = "Узнайте: #" + String(redColor, radix: 16).uppercased() + String(greenColor, radix: 16).uppercased() + String(blueColor, radix: 16).uppercased()
    }
    
    
}
