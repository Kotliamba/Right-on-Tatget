import Foundation

protocol RandomValueGeneratorProtocol{
    static func getRandomValue(minSecretValue: Int, maxSecretValue: Int) -> Int
}

class RandomValueGenerator: RandomValueGeneratorProtocol{
    static func getRandomValue(minSecretValue: Int, maxSecretValue: Int) -> Int{
        return (minSecretValue+1...maxSecretValue-1).randomElement()!
    }
    
    
}
