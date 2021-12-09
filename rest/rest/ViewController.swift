//
//  ViewController.swift
//  rest
//
//  Created by Stefan Hemberger on 09.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var queue = DispatchQueue(label: "Test")
    
    // let link = "https://image.kurier.at/images/cfs_square_1232/4443437/bildschirmfoto_2020-06-04_um_16.54.07.png"
    
    let link = "https://jsonplaceholder.typicode.com/posts"
    
    @IBOutlet weak var demoLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demo()
    }
    
    func demo(){
        
        let url = URL(string: self.link)!
        
        
        self.queue.async {
            
            self.download()
            /*print("in thread")
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data!)
            print("data loaded")*/
            
            DispatchQueue.main.async {
                self.demoLable.text = "Fertig"
                //self.image.image = image
            }
            
        }
        print("main")
    }
    
    func download() -> [String] {
        var titles = [String]()
        if let url = URL(string: self.link) {
            if let data = try? Data(contentsOf: url) {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                    if let array = jsonObject as? [[String: Any]] {
                        for obj in array {
                            if let title = obj["title"] as? String {
                                titles.append(title)
                            }
                        }
                    }
                } else {
                    print("failed to parse json")
                }
            } else {
                print("failed to load data")
            }
        } else {
            print("invalid url")
        }
        
        return titles
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewController = segue.destination as? TableViewController
        //as? -- Typecast
        if let tvc = tableViewController {
            // vc.model = model
        }
    }


}

