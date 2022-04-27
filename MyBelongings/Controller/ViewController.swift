//
//  ViewController.swift
//  MyBelongings
//
//  Created by Vincentius Sutanto on 27/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressNextBtn(_ sender: Any) {
        print("TAPPED!!")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "home") as? HomeViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

