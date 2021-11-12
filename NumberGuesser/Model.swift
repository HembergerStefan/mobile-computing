import Foundation

class Model {
    
    public var target = 0
    public var attempts = 0
    
    func newGame() {
        self.target = Int.random(in: 0...100)
        self.attempts = 10
    }
    
    func isCorrect(guess: Int!) -> Bool {
        return self.compare(guess: guess) == 0
    }
    
    func compare (guess: Int!) -> Int {
        return self.target - guess
    }
    
}
