import UIKit
/*Comment*/
/***/
class GameController: UIViewController {
    
    
    
    @IBOutlet weak var textView: UILabel!
    
    @IBOutlet weak var attemptsLable: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var button: UIButton!

    var model = Model()
    
    override func viewDidLoad() {
       // GameController.instance = self
        super.viewDidLoad()
        self.initView()
    }
    
    func initView() {
        self.model.newGame()
        print("Target number = \(self.model.target)")
        self.inputField.becomeFirstResponder()
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
        
        // update attempts
        self.model.attempts += 1
        self.attemptsLable.text = "\(self.model.attempts + 1). Versuch"
        
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
   

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as? ResultViewController
        //as? -- Typecast
        if let vc = resultViewController {
            vc.model = model
        }
    }
    
    
}
