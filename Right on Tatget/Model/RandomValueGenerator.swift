import Foundation
import UIKit

protocol RandomValueGeneratorProtocol{
    static func getRandomValue(minSecretValue: Int, maxSecretValue: Int) -> Int
}

class RandomValueGenerator: RandomValueGeneratorProtocol{
    static func getRandomValue(minSecretValue: Int, maxSecretValue: Int) -> Int{
        return (minSecretValue+1...maxSecretValue-1).randomElement()!
    }
    static func getRandomColor() -> (UIColor, [CGFloat]){
        let red = CGFloat(Double.random(in: 0...1))
        let green = CGFloat(Double.random(in: 0...1))
        let blue =  CGFloat(Double.random(in: 0...1))
        
        return (UIColor(red: red, green: green, blue: blue, alpha: 1), [red,green,blue])
    }
    
    
}
