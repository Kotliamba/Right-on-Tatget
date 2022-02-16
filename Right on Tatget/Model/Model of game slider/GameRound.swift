import Foundation

protocol GameRoundProtocol{
    var currentSecretValue: Int {get}
    
    func calculateScore(with value: Int) -> Int
}

class GameRound: GameRoundProtocol {
    var currentSecretValue: Int
    
    func calculateScore(with value: Int) -> Int {
        switch value {
        case 0..<currentSecretValue: return  50 - currentSecretValue + value
        case currentSecretValue+1...50: return  50 - value + currentSecretValue
        case currentSecretValue: return 50
        default: print("sompfingh wrong, number is \(currentSecretValue), slider number is \(value)")
            return 0
        }
    }
    
    init(currentSecretValue: Int){
        self.currentSecretValue = currentSecretValue
    }
    
    
}
