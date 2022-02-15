import UIKit
import Foundation

protocol GameProtocol{
    var score: Int {get}
    var currentSecretValue: Int {get}
    var isgameEdned: Bool {get}
    
    func restartGame()
    func startNewRound()
}

class Game:GameProtocol{
    var score: Int = 0
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    var currentSecretValue: Int = 0
    var newSecretValue: Int = 0
    
    private var lastRound: Int
    private var currentRound: Int = 1
    
    var isgameEdned: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    var gameRound: GameRound!
    
    init?(startValue: Int, endValue: Int, rounds: Int){
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        self.lastRound = rounds
        currentSecretValue = RandomValueGenerator.getRandomValue(minSecretValue: self.minSecretValue, maxSecretValue: self.maxSecretValue)
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = RandomValueGenerator.getRandomValue(minSecretValue: self.minSecretValue, maxSecretValue: self.maxSecretValue)
        gameRound = GameRound(score: self.score, currentSecretValue: self.currentSecretValue)
        currentRound += 1
    }
    
    
}

