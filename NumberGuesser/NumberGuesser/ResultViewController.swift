import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var msgLable: UILabel!
    var model:Model!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.initView()
    }

    func initView() {
        self.setImage()
        let attempts = model.attempts
        self.msgLable.text = "Du hast \(attempts) \((attempts == 1) ? "Versuch" : "Versuche") benötigt!"
    }
    
    func setImage() {
       
        let ctr = model.attempts
        
        // set different images
        if ctr < 6 {
            self.imageView.image = UIImage(named: "goodResult")
        } else if ctr < 8 {
            self.imageView.image = UIImage(named: "neutralResult")
        } else {
            self.imageView.image = UIImage(named: "badResult")
        }
        
    }
    
    @IBAction func onAgainButtonClick(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
       // GameController.instance.loadView()  // reload the views
       // GameController.instance.initView()
    }
}
