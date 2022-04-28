//
//  HomeViewController.swift
//  MyBelongings
//
//  Created by Vincentius Sutanto on 27/04/22.
//

import UIKit

public var index = 0

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addItemBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        
        //tableView.isHidden = true
    }
    
    @IBAction func pressAddItem(_ sender: Any) {
        let addItemVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddItemID")
        if let sheet = addItemVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 24
        }
        
        self.present(addItemVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "BelongingsCellID", for: indexPath) as? BelongingsCell)!
        
        cell.titleLabel.text = "Wallet"
        cell.categoryLabel.text = "Wears"
        cell.typeLabel.text = "Important"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
