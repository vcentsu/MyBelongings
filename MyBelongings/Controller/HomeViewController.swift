//
//  HomeViewController.swift
//  MyBelongings
//
//  Created by Vincentius Sutanto on 27/04/22.
//

import UIKit

public var i: Int = 0

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addItemBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var homeBg: UIImageView!
    @IBOutlet weak var homeDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        
        //tableView.isHidden = true
        updateView()
        
    }
    
    func updateView() {
        if (i == 0){
            tableView.isHidden = true
            homeBg.isHidden = false
            homeDesc.isHidden = false
        }else{
            tableView.isHidden = false
            tableView.reloadData()
            homeBg.isHidden = true
            homeDesc.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMain), name: Notification.Name("updateViewMain"), object: nil)
    }
    
    @objc func updateMain() {
        i = belongingsData.item.count
        DispatchQueue.main.async {
            self.updateView()
        }
    }
    
    @IBAction func pressAddItem(_ sender: Any) {
        let addItemVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddItemID")
        if let sheet = addItemVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 24
        }
        
        self.present(addItemVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return CGFloat(5)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return belongingsData.item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "BelongingsCellID", for: indexPath) as? BelongingsCell)!
        
        cell.titleLabel.text = belongingsData.item[indexPath.row].itemTitle
        cell.categoryLabel.text = belongingsData.item[indexPath.row].itemCategory
        if (belongingsData.item[indexPath.row].itemType == true) {
            cell.typeLabel.text = "Important"
            cell.typeLabel.backgroundColor = .yellow
        }else{
            cell.typeLabel.text = "Normal"
            cell.typeLabel.backgroundColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
