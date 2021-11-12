//
//  ResultViewController.swift
//  NumberGuesser
//
//  Created by Stefan Hemberger on 12.11.21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setImage()
    }

    func setImage() {
       
        let ctr = GameController.viewController.model.attempts
        
        if ctr < 6 {
            self.imageView.image = UIImage(named: "goodResult")
        } else if ctr < 8 {
            self.imageView.image = UIImage(named: "neutralResult")
        } else {
            self.imageView.image = UIImage(named: "badResult")
        }
        
    }
    
}
