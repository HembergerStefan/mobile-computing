import UIKit

class GameController: UIViewController {
    
    static weak var viewController: GameController!
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var textView: UILabel!
    
    @IBOutlet weak var button: UIButton!
    // let target: Int = Int.random(in: 0...100)
    var model = Model()
    
    override func viewDidLoad() {
        GameController.viewController = self
        super.viewDidLoad()
        self.model.newGame()
        print("Target number = \(self.model.target)")
    }
    
    
    @IBAction func onEditingChanged(_ sender: Any) {
        
        // check if the user enterd valid input
        if Int(self.inputField.text!) == nil {
            self.inputField.text = ""
            self.button.isEnabled = false
        } else {
            self.button.isEnabled = true
        }
        
    }
    
    @IBAction func onCheckButtonClicked(_ sender: Any) {
        
        // increase attempts counter
        self.model.attempts += 1
        
        // change hint text
        if let guess = Int(self.inputField.text!) {
            let diff = self.model.compare(guess: guess)
            textView.text = "Die Zahl ist \((diff > 0) ? "größer": (diff < 0) ? "kleiner" : "richtig")!"
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let guess = Int(self.inputField.text!) {
            return self.model.isCorrect(guess: guess)
        }
        return false
    }
    
}
